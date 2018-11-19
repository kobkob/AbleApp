package App::Able::Configure;

use strict;
use base qw(App::Able::Model);

use App::Able::Bot;



=head1 CONFIGURE



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
  my $self = shift;
  my $sc   = shift;
  my $class = { table => 'Configure' };
  $class->{model} = $sc; # dbic schema
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
