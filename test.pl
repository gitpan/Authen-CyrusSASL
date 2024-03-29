# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN {print "1..4\n";}
END {print "not ok 1\n" unless $loaded;}
use Authen::CyrusSASL;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

print "Enter the type of your authentication mechanism (1 for pwcheck, 2 for saslauthd): "; chomp($type = <STDIN>);
$type = ($type == 1) ? SASL_PWCHECK : SASL_AUTHD;
print "Enter path for your SASLAuth daemon: "; chomp ($path = <STDIN>);
print "Enter a username to be validated: "; chomp ($user = <STDIN>);
print "Enter this user's password: "; chomp ($pwd = <STDIN>);

$t = 2;
$r = new Authen::CyrusSASL(Type => $type, Path => $path);
print defined $r ? "" : "not ", "ok $t\n"; $t++;

print (($r->check_pwd($user, $pwd) == SASL_OK) ? "" : "not ", "ok $t\n"); $t++;

exit;

