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
isa_ok($app->{Monitor}, "App::Able::Monitor");

my $result = $schema->resultset('Monitor')->all;

#CRUD
my $id = $app->{Monitor}->create({projid=>1, name=>"MyName"})->id; 
ok($app->{Monitor}->read({ id => $id })->first->name eq "MyName" , "Created"); 
$app->{Monitor}->update({id => $id}, {name=>"MyNewName"}); 
ok($app->{Monitor}->read({ id => $id })->first->name eq "MyNewName", "Updated" ); 
$app->{Monitor}->delete({ id => $id }); 
ok($app->{Monitor}->read({ id => $id }) == 0, "Deleted" ); 

diag( "Testing Class App::Able::Monitor." );

