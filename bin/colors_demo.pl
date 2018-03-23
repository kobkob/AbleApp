#!/usr/bin/env perl

use 5.10.0;
use strict;
use warnings;

use Term::ANSIColor;
use Term::ReadKey;

my ( $wchar, $hchar, $wpixels, $hpixels ) = GetTerminalSize();

print color('bold blue');
print "This text is bold blue.\n";
print color('reset');
print "This text is normal.\n";
print colored( "Yellow on magenta.", 'yellow on_magenta' ), "\n";
print "This text is normal.\n";
print colored( ['yellow on_magenta'],    'Yellow on magenta.',    "\n" );
print colored( ['red on_bright_yellow'], 'Red on bright yellow.', "\n" );
print colored( ['bright_red on_black'],  'Bright red on black.',  "\n" );
print "\n";

print color('on_black');
print color('magenta'), "1- ", color('blue'), 'blue', color('red'), ' red',
  color('yellow'), ' yellow', ' ' x ( $wchar - 18 );


my $key;

ReadMode 4;    # Turn off controls keys
while ( not defined( $key = ReadKey(-1) ) ) {

    # No key yet
}


cls();

print "Get key $key\n";

my @column =
  ( "teste 1", "something", "12345", 'F' );
my $ncols = @column;

my $colsize = int ( $wchar / $ncols );
my @col;
for ( my $i = 0; $i < $ncols; $i++ ) {
  #$col[$i] = $colsize - length ($column[$i]);
  $col[$i] = $colsize;
}

print color('on_red');
printf "%-"
  . $col[0] . "s %-"
  . $col[1] . "s %-"
  . $col[2] . "s %-"
  . $col[3]
  . "s\n", $column[0], $column[1], $column[2], $column[3];

print color('on_black');
printf "%-"
  . $col[0] . "s %-"
  . $col[1] . "s %-"
  . $col[2] . "s %-"
  . $col[3]
  . "s\n", "algo longo", "algo muito longo mesmo", "bu", "1234567";

print color('on_bright_black');
 printf "%-"
  . $col[0] . "s %-"
  . $col[1] . "s %-"
  . $col[2] . "s %-"
  . $col[3]
  . "s\n", "COisas", "algo mesmo", "kkkkk", "1267";

print color('on_black');
printf "%-"
  . $col[0] . "s %-"
  . $col[1] . "s %-"
  . $col[2] . "s %-"
  . $col[3]
  . "s\n", "ongobongo", "muito bom mesmo", "nhé ", "---";



print "\n";
print color('reset');

ReadMode 0;    # Reset tty mode before exiting

sub cls {
    print "\033[2J";      #clear the screen
    print "\033[0;0H";    #jump to 0,0
}
