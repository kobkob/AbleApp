use utf8;
package App::Able::Schema::Result::Project;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Able::Schema::Result::Project

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Project>

=cut

__PACKAGE__->table("Project");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 buid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "buid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
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
  { "foreign.projid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 creations

Type: has_many

Related object: L<App::Able::Schema::Result::Creation>

=cut

__PACKAGE__->has_many(
  "creations",
  "App::Able::Schema::Result::Creation",
  { "foreign.projid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 monitors

Type: has_many

Related object: L<App::Able::Schema::Result::Monitor>

=cut

__PACKAGE__->has_many(
  "monitors",
  "App::Able::Schema::Result::Monitor",
  { "foreign.projid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 packages

Type: has_many

Related object: L<App::Able::Schema::Result::Package>

=cut

__PACKAGE__->has_many(
  "packages",
  "App::Able::Schema::Result::Package",
  { "foreign.projid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 plans

Type: has_many

Related object: L<App::Able::Schema::Result::Plan>

=cut

__PACKAGE__->has_many(
  "plans",
  "App::Able::Schema::Result::Plan",
  { "foreign.projid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 releases

Type: has_many

Related object: L<App::Able::Schema::Result::Release>

=cut

__PACKAGE__->has_many(
  "releases",
  "App::Able::Schema::Result::Release",
  { "foreign.projid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 verifications

Type: has_many

Related object: L<App::Able::Schema::Result::Verification>

=cut

__PACKAGE__->has_many(
  "verifications",
  "App::Able::Schema::Result::Verification",
  { "foreign.projid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-03-20 02:07:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ykM6PctCeJXIq23ptZC/lg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
