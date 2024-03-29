# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use Authen::RBAC::Group::Acl::PolicyFactory::Deny;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my $deny = new  Authen::RBAC::Group::Acl::PolicyFactory::Deny;

print "ok 2\n" if defined ($deny);

$deny->set_base_pattern('core.*');
$base_pattern = $deny->get_base_pattern();

print "ok 3\n" if ($base_pattern eq 'core.*' );

$deny->set_typename('Deny');
$typename = $deny->get_typename();

print "ok 4\n" if ($typename eq 'Deny' );

$deny->set_arg_patterns(["foo.*","bar.*"]);
$arg_patterns = $deny->get_arg_patterns();
 
print "ok 5\n" if ( ref $arg_patterns eq 'ARRAY');
 
print "ok 6\n" if (ref $deny->output_xml() eq 'ARRAY'); 

