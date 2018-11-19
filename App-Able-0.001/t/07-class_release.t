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
isa_ok($app->{Release}, "App::Able::Release");

my $result = $schema->resultset('Release')->all;

#CRUD
my $id = $app->{Release}->create({projid=>1, name=>"MyName"})->id; 
ok($app->{Release}->read({ id => $id })->first->name eq "MyName" , "Created"); 
$app->{Release}->update({id => $id}, {name=>"MyNewName"}); 
ok($app->{Release}->read({ id => $id })->first->name eq "MyNewName", "Updated" ); 
$app->{Release}->delete({ id => $id }); 
ok($app->{Release}->read({ id => $id }) == 0, "Deleted" ); 

diag( "Testing Class App::Able::Release." );

