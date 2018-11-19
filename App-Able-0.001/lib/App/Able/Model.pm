package App::Able::Model;

use strict;

=head1 METHODS FOR SUBCLASSING

=head3 read

   Parameters :
      param : $ : DBIC parameters

   Return : 
      DBIC tuplet with the new project data

   Description : 
      Read (SQL Select) data from the project on DBIC, sets object data

=cut

sub read
{
  my $self  = shift;
  my $param = shift;
  $self->{data} = $self->{model}->resultset($self->{table})->search($param);
  return $self->{data};
}

=head3 update

   Parameters :
      param : $ : DBIC parameters

   Return : 
      DBIC tuplet with the new project data

   Description : 
      Update the project on DBIC, sets object data

=cut

sub update
{
  my $self  = shift;
  my $query = shift;
  my $param = shift;
  $self->{data} = $self->{model}->resultset($self->{table})->search($query)->update($param);
  return $self->{data};
}

=head3 create

   Parameters :
      param : $ : DBIC parameters

   Return : 
      DBIC tuplet with the new project data

   Description : 
      Store a new project on DBIC, sets created object data

=cut

sub create
{
  my $self  = shift;
  my $param = shift;
  $self->{data} = $self->{model}->resultset($self->{table})->create($param);
  return $self->{data};
}

=head3 delete

   Parameters :
      param : $ : DBIC parameters

   Return : 
      DBIC tuplet with the new project data

   Description : 
      Delete the project on DBIC, clear object data

=cut

sub delete
{
  my $self  = shift;
  my $param = shift;
  $self->{data} = {};
  $self->{model}->resultset($self->{table})->search($param)->delete;
}

return 1;
