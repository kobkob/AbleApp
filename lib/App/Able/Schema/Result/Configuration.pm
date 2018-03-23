use utf8;
package App::Able::Schema::Result::Configuration;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Able::Schema::Result::Configuration

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Configuration>

=cut

__PACKAGE__->table("Configuration");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 projid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 mgrid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 url

  data_type: 'text'
  is_nullable: 1

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "projid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "mgrid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "url",
  { data_type => "text", is_nullable => 1 },
  "description",
  { data_type => "text", is_nullable => 1 },
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

=head2 mgrid

Type: belongs_to

Related object: L<App::Able::Schema::Result::Manager>

=cut

__PACKAGE__->belongs_to(
  "mgrid",
  "App::Able::Schema::Result::Manager",
  { id => "mgrid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 projid

Type: belongs_to

Related object: L<App::Able::Schema::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "projid",
  "App::Able::Schema::Result::Project",
  { id => "projid" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-03-20 02:07:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:K+RUzo0a+UL8eL9svHVqlg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
