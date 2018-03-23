#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 12;

use App::Able;

my $app = new App::Able;

ok ($app->{model}, "App has a model!!!");

#diag( "The app model driver: $App::Able::MODEL" );

# Link and load sqlite database on dbic
use App::Able::Schema qw();
my $schema = App::Able::Schema->connect('dbi:SQLite:assets/db_default.db');

ok($schema,"Connects to db!!!");



#diag( "Found entities: " . join ( " ", $schema->sources ) );

# Verify if the model has all needed entities
foreach my $entity (qw 'Release Verification BussinessUnit Plan Package Monitor Domain Creation Configuration Project' ) {

  ok($schema->sources($entity),"Has the '$entity' table!!!");
  #diag( "--- $entity columns: " . 
  #  join ( " ", $schema->source($entity)->columns ) );
  #diag( "--- $entity relations: " . 
  #  join ( " ", $schema->source($entity)->relationships ) );
}
$app->{model} = $schema;

diag( "Testing app's model." );

