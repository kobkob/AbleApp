

package App::Able::Project;

use strict;
use base qw(App::Able::Model);

use App::Able::Bot;


=head1 CONSTRUCTOR

=head3 new

   Parameters :
      schema : $ : DBIC Schema object

   Return : 
      App::Able::Project

   Description : 
      Create a new Able::Project

=cut

sub new
{
  my $self = shift;
  my $sc   = shift;
  my $class = { table => 'Project' };
  $class->{model} = $sc; # dbic schema
  bless $class, $self;
}



=head1 PUBLIC ATTRIBUTES

=pod 



=cut


=head1 PUBLIC METHODS

=head3 bot

   Parameters :
      swarn : $ : Array ref with all bot queries

   Return : 
      Array ref of App::Able::Bot

   Description : 
      Create a swarn of bots

=cut

sub bot
{
  my $self  = shift;
  my $swarn = shift;
  my $bots  = [];
  foreach my $qry (@$swarn){
	  my $bot = App::Able::Bot->new($qry);
	  push @$bots, $bot;
  }
  return $bots;
}


=head1 METHODS FOR SUBCLASSING



=cut


=head1 PRIVATE METHODS



=cut






return 1;
