#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

use App::Able;
use Minion;

my $app = new App::Able;

# Link and load sqlite database on Dbi and job queue on Minion
use App::Able::Schema qw();
my $schema = App::Able::Schema->connect(
  'dbi:SQLite:./assets/db_default.db');
my $minion =
  Minion->new(
  SQLite => 'sqlite:assets/db_default.db' );
$app->setup_model($schema);
$app->setup_bot($minion);

# Load the bots
$app->bot(
  [
    {
      id      => 'test1',
      tool    => 'Project',
      command => sub {
        my ( $job, @args ) = @_;
        sleep 5;
        say 'This is a long background worker process.';
      },
      autorun => 1,
    },
    {
      id      => 'test2',
      tool    => 'Project',
      command => sub {
        my ( $job, @args ) = @_;
        sleep 2;
        say
          'This is a short background worker process.';
      }
        autorun => 1,
    },

  ]
);

# Create a new project
my $rs = $app->{Project}
  ->create( { buid => 1, name => "BotTest" } );

ok( $bot, "It's a bot swarn" );

$app->{Project}->delete( { id => $rs->id } );

use Data::Dumper;
print Dumper $bot;

diag("Testing robots.");

