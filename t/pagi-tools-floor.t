use strict;
use warnings;
use Test::More;

#  WebDyne::PAGI relies on the PAGI-Tools 0.002003 API. An older install must
#  fail at load time with a clear version message, not later mid-request.
#
BEGIN {
    $INC{'PAGI/Tools.pm'}=__FILE__;
    $PAGI::Tools::VERSION='0.002002';
    $ENV{'WEBDYNE_CONF'}='.';
}

ok(!eval { require WebDyne::PAGI; 1 }, 'WebDyne::PAGI refuses PAGI-Tools 0.002002');
like($@, qr/PAGI::Tools version 0\.002003 required/, 'refusal names the version needed');

done_testing();
