package App::Able;

use 5.006;
use strict;
use warnings;


=head1 NAME

App::Able - The agile DevOps manager

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

our $MODEL = 'SQLite';

our $BOTS = ['launch','deploy','email','run','stop'];

=head1 PUBLIC ATTRIBUTES

=pod 

=head3 config

   Description : Object with all configuration. 

=head3 dbic

   Description : The database link.

=cut

=head1 SYNOPSIS

Organizes and performs DevOps actions on agile projects.

Works as a Facade for the 7 modules.

    use App::Able;

    my $plan = App::Able->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.



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
  $self->{config} = $conf;
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
  my $self = shift;
  my %stuff = %_; # % : Stuff to put on able
  my @acts = qw (Project Plan Create Verify Pack Configure Release Monitor);
  $stuff{model} = {};
  $stuff{actions} = \@acts;
  bless {%stuff}, $self;
}


=head3 setup_model

   Parameters :
      schema : $ : The DBIC object

   Return : 
      integer

   Description : 
      Setup the model, instantiating each class

=cut

sub setup_model
{
  my $self = shift;
  my $dbic = shift;
  $self->{model} = $dbic;
  my $acts = $self->{actions};
  foreach my $action (@$acts){
      my $code = "
           require App::Able::$action; 
           \$self->{$action} = new App::Able::$action(\$dbic);
       ";
      eval $code or do { print "Error: $@\n"; };
 }
  return 1;
}




=head1 AUTHOR

Monsenhor, C<< <filipo at kobkob.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-app-able at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-Able>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::Able


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-Able>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/App-Able>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/App-Able>

=item * Search CPAN

L<http://search.cpan.org/dist/App-Able/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2018 Monsenhor.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of App::Able
