package App::Able::Bot;

use strict;
use App::Able::iBot;
use Minion;

use base qw(App::Able::iBot );



=head1 BOT



=cut

=head1 CONSTRUCTOR



=cut

=head3 new

   Parameters :
      stuff : $ : Stuff to put on

   Return : 
      App::Able::Bot

   Description : 
      Create a new Able::Bot

=cut

sub new
{
  my $self  = shift;
  my $query = shift;
  my $class = {};
  $class->{job} = shift; 
  bless $class, $self;
}




=head1 PUBLIC ATTRIBUTES

=pod 



=cut


=head1 PUBLIC METHODS



=cut


=head1 METHODS FOR SUBCLASSING



=cut


=head1 PRIVATE METHODS



=cut






return 1;
