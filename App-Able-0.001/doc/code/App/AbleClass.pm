

package App::AbleClass;


#UML_MODELER_BEGIN_PERSONAL_VARS_AbleClass

#UML_MODELER_END_PERSONAL_VARS_AbleClass

use App::Able::Dev;
use App::Able::Plan;
use App::Able::Ops;



=head1 ABLECLASS



=cut


=head1 PUBLIC ATTRIBUTES

=pod 

=head3 config

   Description : Object with all configuration. 

=head3 dbic

   Description : The database link.



=cut


=head1 PUBLIC METHODS

=pod 

=head3 load_conf

   Parameters :
      conf : $ : Object with all configuration 

   Return : 
      $

   Description : 
      Load the configuration as an object

=cut

sub load_conf
{
  my($self,
     $conf, # $ : Object with all configuration 
   ) = @_;
#UML_MODELER_BEGIN_PERSONAL_CODE_load_conf
  $self = shift;
  $self->{config} = shift;
  return $self->{config}->{version};
#UML_MODELER_END_PERSONAL_CODE_load_conf
}


=pod 

=head3 new

   Parameters :
      stuff : $ : Stuff to put on able

   Return : 
      App::Able

   Description : 
      Create a new Able

=cut

sub new
{
  my($self,
     $stuff, # $ : Stuff to put on able
   ) = @_;
#UML_MODELER_BEGIN_PERSONAL_CODE_new
  return bless {_$};
#UML_MODELER_END_PERSONAL_CODE_new
}




=cut


=head1 METHODS FOR SUBCLASSING



=cut


=head1 PRIVATE METHODS



=cut






return 1;
