declare @tmpdbid table (dbid int primary key)
        insert into @tmpdbid(dbid)
            select do.DB_ID from stableidentifier si
                join databaseobject do on si.DB_ID = do.stableIdentifier
            where si.identifier in 
            (
                select distinct stableid from 
                (
                    select stableid1 as stableid from interactions 
                    where (geneid1= :geneid1 and geneid2= :geneid2)
                        or (geneid1= :geneid2 or geneid2= :geneid1)
                union
                    select stableid2 as stableid from interactions 
                    where (geneid1= :geneid1 and geneid2= :geneid2)
                        or (geneid1= :geneid2 or geneid2= :geneid1)
                ) T
            )

        declare @ids table (dbid int primary key)
        insert into @ids(dbid)
            select distinct * from
            (
                select DB_ID from reactionlikeevent_2_output r2o
                    inner join @tmpdbid tdbid on r2o.output = tdbid.dbid
            union
                select DB_ID from reactionlikeevent_2_input r2i
                    inner join @tmpdbid tdbid on r2i.input = tdbid.dbid
            ) T

        declare @id int
        declare c cursor for select * from @ids
        declare @treeids table (dbid int primary key)

        open c
        fetch from c into @id
        while @@fetch_status = 0
        begin
            insert into @treeids(dbid)
                select splitvalue 
                from 
                    dbo.split((select distinct Lineage from Tree where rid = @id), '/')
                where not exists (select * from @treeids where dbid = splitvalue)
            fetch from c into @id
        end
        close c
        deallocate c

        select distinct e2n.db_id as id, e2n.name as description, 
            si.identifier as pathname 
        from Tree T 
            join event_2_name e2n on T.rid = e2n.DB_ID 
            join databaseobject do on e2n.DB_ID = do.DB_ID 
            join stableidentifier si on do.stableidentifier = si.DB_ID 
        where T.node in (select * from @treeids)
            and T.class = 'Pathway'