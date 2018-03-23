use utf8;
package App::Able::Schema::Result::Domain;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::Able::Schema::Result::Domain

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Domain>

=cut

__PACKAGE__->table("Domain");

=head1 ACCESSORS

=head2 id

  data_type: 'long int'
  is_nullable: 0

=head2 name

  data_type: 'string'
  is_nullable: 0

=head2 id_bus

  data_type: 'long int'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "long int", is_nullable => 0 },
  "name",
  { data_type => "string", is_nullable => 0 },
  "id_bus",
  { data_type => "long int", is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-03-20 02:07:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:552T9BIa5nR7vd8CsJSOQA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
