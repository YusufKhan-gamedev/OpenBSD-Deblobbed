################################################################################
#
#            !!!!!   Do NOT edit this file directly!   !!!!!
#
#            Edit mktests.PL and/or parts/inc/SvREFCNT instead.
#
#  This file was automatically generated from the definition files in the
#  parts/inc/ subdirectory by mktests.PL. To learn more about how all this
#  works, please read the F<HACKERS> file that came with this distribution.
#
################################################################################

use FindBin ();

BEGIN {
  if ($ENV{'PERL_CORE'}) {
    chdir 't' if -d 't';
    unshift @INC, '../lib' if -d '../lib' && -d '../ext';
    require Config; import Config;
    use vars '%Config';
    if (" $Config{'extensions'} " !~ m[ Devel/PPPort ]) {
      print "1..0 # Skip -- Perl configured without Devel::PPPort module\n";
      exit 0;
    }
  }

  use lib "$FindBin::Bin";
  use lib "$FindBin::Bin/../parts/inc";

  die qq[Cannot find "$FindBin::Bin/../parts/inc"] unless -d "$FindBin::Bin/../parts/inc";

  sub load {
    require 'testutil.pl';
    require 'inctools';
  }

  if (14) {
    load();
    plan(tests => 14);
  }
}

use Devel::PPPort;
use strict;
BEGIN { $^W = 1; }

package Devel::PPPort;
use vars '@ISA';
require DynaLoader;
@ISA = qw(DynaLoader);
bootstrap Devel::PPPort;

package main;

for (Devel::PPPort::SvREFCNT()) {
  ok(defined $_ and $_);
}

