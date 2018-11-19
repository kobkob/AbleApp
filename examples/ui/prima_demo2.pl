#!/usr/bin/env perl
=pod

=head1 NAME

examples/calendar.pl - Standard calendar widget

=head1 FEATURES

Demonstrates usage of L<Prima::Calendar>.
Note the special check of C<useLocale> success.

=cut

use strict;
use warnings;
use Prima;
use Prima::Application name => 'Calendar';
use Prima::Calendar;

my $cal;
my $w = Prima::MainWindow->new(
	text => "Calendar example",
	size => [ 200, 200],
	designScale => [6,16],
	menuItems => [[ "~Options" => [
		[ 'locale', 'Use ~locale', 'Ctrl+L', '^L', sub {
			my ( $self, $mid) = @_;
			my $newstate;
			$cal-> useLocale( $newstate = $self-> menu-> toggle( $mid));
			$cal-> notify(q(Change));
			return unless $newstate && !$cal-> useLocale;
			$self-> menu-> uncheck( $mid);
			Prima::message("Selecting 'locale' failed");
		}],
		[ 'Re~set to current date', 'Ctrl+R', '^R', sub {
			$cal-> date_from_time( localtime( time));
		}],
		[ 'monday', '~Monday is the first day of week', sub {
			my ( $self, $mid) = @_;
			$cal-> firstDayOfWeek( $self-> menu-> toggle( $mid) ? 1 : 0);
		}],
	]]],
);

$cal = $w-> insert( Calendar =>
	useLocale => 1,
	onChange  => sub {
		$w-> text( "Calendar - ".$cal-> date_as_string);
	},
	pack => { expand => 1, fill => 'both'},
);

$w-> menu-> locale-> check if $cal-> useLocale;

run Prima;

