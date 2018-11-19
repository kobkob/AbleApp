#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 4;

use App::Able;

my $app = new App::Able;

# Link and load sqlite database on dbic
use App::Able::Schema qw();
my $schema = App::Able::Schema->connect('dbi:SQLite:./assets/db_default.db');
$app->setup_model ($schema);
isa_ok($app->{Verify}, "App::Able::Verify");

my $result = $schema->resultset('Verification')->all;

#CRUD
my $id = $app->{Verify}->create({projid=>1, name=>"MyName"})->id; 
ok($app->{Verify}->read({ id => $id })->first->name eq "MyName" , "Created"); 
$app->{Verify}->update({id => $id}, {name=>"MyNewName"}); 
ok($app->{Verify}->read({ id => $id })->first->name eq "MyNewName", "Updated" ); 
$app->{Verify}->delete({ id => $id }); 
ok($app->{Verify}->read({ id => $id }) == 0, "Deleted" ); 

diag( "Testing Class App::Able::Verify." );

