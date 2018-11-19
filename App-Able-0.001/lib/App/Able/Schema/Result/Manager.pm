use utf8;
package App::Able::Schema::Result::Manager;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Able::Schema::Result::Manager

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Manager>

=cut

__PACKAGE__->table("Manager");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 command

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "command",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 configurations

Type: has_many

Related object: L<App::Able::Schema::Result::Configuration>

=cut

__PACKAGE__->has_many(
  "configurations",
  "App::Able::Schema::Result::Configuration",
  { "foreign.mgrid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-03-20 02:07:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:E+NLTns9TM8jKfuX5S7ORQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
