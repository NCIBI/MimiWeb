#!/usr/bin/perl -w

# The source code files, properties files, other text files, and other files
# in this package (the Software) are
#
# Copyright (c) by the Regents of the University of Michigan
#
# and were written or modified from other sources by the development team
# of the National Center for Integrative Biomedical Informatics, University
# of Michigan.
#
# Development of the software is supported by National Institutes of Health,
# Grant U54 DA021519
#
# see www.ncibi.org for details.
#
# By using, modifying, or using derivative products of the software, you are
# agreeing to these Terms of Use:
# (see http://portal.ncibi.org/gateway/pdf/Terms%20of%20use-web.pdf)
#
# General Use Policy:
#
# For academic and non-profit institutions:
#   - Permission is granted to access, use and/or download the Tools for
#     internal use only
#   - Users must inform NCIBI of any derivative works of the Tools created
#     (e-mail: ncibihelp@umich.edu)
#   - Use of the Tools must be acknowledged in resulting publications
#     (see citation policy below)
#
# For commercial and for-profit institutions:
#   - Permission is granted to access, use, and/or download the Tools for
#     internal use only
#   - To create derivative works of the Tools for commercial purposes, source
#     code or access to databases may be permitted through negotiation for a
#     commercial license. Please send request through: ncibi-help@umich.edu
#
# Citation of use of this software must include reference to:
#
# National Center for Integrative Biomedical Informatics,
# University of Michigan.
#
# Disclaimer:
# THE USER AGREES THAT THE TOOLS ARE PROVIDED AS IS, WITHOUT REPRESENTATION
# OR WARRANTY BY THE UNIVERSITY OF MICHIGAN OF ANY KIND, EITHER EXPRESS OR
# IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. The Regents of the
# University of Michigan shall not be liable for any damages, including
# special, indirect, incidental or consequential damages, with respect to any
# claim arising out of, or in connection with, the use of these Tools,
# Software, or derivative products, even if it has been or is hereafter
# advised of the possibility of such damages. Nothing in this license shall
# be deemed to grant any rights of the University of Michigan except as
# expressly stated herein. The names and trademarks of the University of
# Michigan may NOT be used in advertising or publicity pertaining to your
# use of the Tools, except as expressly stated herein.

use strict;
use warnings;
use XML::XPath;
use XML::XPath::XMLParser;
use LWP::UserAgent qw($ua get);

my $ua = new LWP::UserAgent;

my $response = $ua->get('http://mimi.ncibi.org/MimiWeb/fetch.jsp?gene=1436');

my $xp = XML::XPath->new(xml => $response->content);

foreach my $geneid ($xp->find('//InteractingGene/GeneID')->get_nodelist) {
	print $geneid->string_value . "\n";
}
