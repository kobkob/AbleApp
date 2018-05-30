#!perl -T
use 5.12.0;
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
# actualy it can run external commands, straigth subs or load bot modules
$app->bot(
  [
    {
      id   => 'bot1',
      tool => 'Project',
      run =>
        'curl http://kobkob.org',    # external command
      autorun => 1,
    },
    {
      id      => 'bot2',
      tool    => 'Project',
      command => sub {               # perl sub
        my ( $job, @args ) = @_;
        sleep 2;
        say
          'This is a short background worker process.';
      },
      autorun => 1,
    },
    {
      id      => 'bot3',
      tool    => 'Project',
      module  => 't/bot3.pm',        # perl module
      autorun => 1,
    },
  ]
);

# Create a new project
my $rs = $app->{Project}
  ->create( { buid => 1, name => "BotTest" } );

ok( $app->bot, "It's a bot swarn" );

$app->{Project}->delete( { id => $rs->id } );

use Data::Dumper;
print Dumper $app->bot;

diag("Testing robots.");

