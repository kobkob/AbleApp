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
isa_ok($app->{Create}, "App::Able::Create");

my $result = $schema->resultset('Creation')->all;

#CRUD
my $id = $app->{Create}->create({projid=>1, name=>"MyName"})->id; 
ok($app->{Create}->read({ id => $id })->first->name eq "MyName" , "Created"); 
$app->{Create}->update({id => $id}, {name=>"MyNewName"}); 
ok($app->{Create}->read({ id => $id })->first->name eq "MyNewName", "Updated" ); 
$app->{Create}->delete({ id => $id }); 
ok($app->{Create}->read({ id => $id }) == 0, "Deleted" ); 

diag( "Testing Class App::Able::Create." );

