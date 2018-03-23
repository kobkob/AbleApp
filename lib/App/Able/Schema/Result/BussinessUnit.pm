use utf8;
package App::Able::Schema::Result::BussinessUnit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Able::Schema::Result::BussinessUnit

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<BussinessUnit>

=cut

__PACKAGE__->table("BussinessUnit");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-03-20 02:07:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TDCuP5Cby1BSVcwvidi7pg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
