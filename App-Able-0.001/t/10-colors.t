#!perl -T
use 5.12.0;
use strict;
use warnings;
use Test::More tests => 5;


use App::Able;
 
# Load the module.
BEGIN {
    delete $ENV{ANSI_COLORS_ALIASES};
    delete $ENV{ANSI_COLORS_DISABLED};
    use_ok('Term::ANSIColor', qw(:pushpop));
}

# Generate a tainted constant name.  PATH is always tainted, and tainting is
# sticky, so we can prepend the name to whatever PATH holds and then chop it
# off again.
my $constant = substr 'BOLD' . $ENV{PATH}, 0, length 'BOLD';
 
# Using that as a constant should now work without any tainting problems.
## no critic (TestingAndDebugging::ProhibitNoStrict)
{
    no strict 'refs';
    is(&{$constant}(), "\e[1m", 'Constant subs are not tainted');
    is(BOLD(),         "\e[1m", '...and we can call the sub again');
    ok(defined(&Term::ANSIColor::BOLD), '...and it is now defined');
}

#######################################################
# some sample colors

my $app = new App::Able;

use Carp qw(croak);
use Term::ANSIColor 4.00 qw(color);

# Screen width for centering headings.
use constant SCREEN_WIDTH => 80;
 
# The basic attributes and eight colors.
use constant ATTRIBUTES => qw(bold dark italic underline blink concealed);
use constant COLORS     => qw(black red green yellow blue magenta cyan white);
 
# print and printf with error checking.  autodie unfortunately can't help us
# with these because they can't be prototyped and hence can't be overridden.
 
## no critic (Subroutines::RequireArgUnpacking)
sub print_checked  { print @_  or croak('print failed');  return }
sub printf_checked { printf @_ or croak('printf failed'); return }
## use critic
 
# The sample background or foreground colors for 256-color tests.
my @SAMPLES = qw(000 222 555);
 
# The list of all possible RGB values.
my @RGB;
for my $r (0 .. 5) {
    for my $g (0 .. 5) {
        push(@RGB, map { "$r$g$_" } 0 .. 5);
    }
}

ok (&print_basic_test, "Examples printed sucessfully");

# Center a text string with spaces.
#
# $text  - Text to center
# $width - Width in which to center the text
#
# Returns: Text centered within that width
sub center {
    my ($text, $width) = @_;
    my $padding  = $width - length($text);
    my $trailing = int($padding / 2);
    my $leading  = $padding - $trailing;
    return (q{ } x $leading) . $text . (q{ } x $trailing);
}
 
# Print out the test file that tries all the basic eight ANSI colors.
#
# Returns: undef
#  Throws: Text exception on I/O failure
sub print_basic_test {
    print_checked("Basic ANSI colors (eight-color, or dim)\n\n");
    for my $bg (COLORS) {
        printf_checked('%4s %-7s ', q{ }, $bg);
        for my $fg (COLORS) {
            print_checked(color($fg, "on_$bg"), center($fg, 8));
        }
        print_checked(color('reset'), "\n");
        printf_checked('%4s %-7s ', 'bold', $bg);
        for my $fg (COLORS) {
            print_checked(color($fg, 'bold', "on_$bg"), center($fg, 8));
        }
        print_checked(color('reset'), "\n");
    }
    print_checked("\nAttributes: ");
    for my $fg (ATTRIBUTES) {
        print_checked(center($fg, 10));
    }
    print_checked("\n", q{ } x 12);
    for my $fg (ATTRIBUTES) {
        print_checked(color($fg), center('testing', 10), color('reset'));
    }
    print_checked("\n\n");
    return 1;
}
 
# Print out the test file that tries all the bright colors from the
# sixteen-color palette.
#
# Returns: undef
#  Throws: Text exception on I/O failure
sub print_bright_test {
    print_checked("Bright ANSI colors (sixteen-color)\n\n");
    for my $bg (COLORS) {
        printf_checked('%6s %-7s ', 'dim', $bg);
        for my $fg (COLORS) {
            my $escape = color("bright_$fg", "on_$bg");
            print_checked($escape, center($fg, 8));
        }
        print_checked(color('reset'), "\n");
        printf_checked('%6s %-7s ', 'bright', $bg);
        for my $fg (COLORS) {
            my $escape = color("bright_$fg", "on_bright_$bg");
            print_checked($escape, center($fg, 8));
        }
        print_checked(color('reset'), "\n");
    }
    print_checked("\n");
    return;
}
 
# Print out the test file that tries all valid RGB foreground colors.
#
# Returns: undef
#  Throws: Text exception on I/O failure
sub print_fg256_test {
    print_checked("RGB000 - RGB555 from 256-color palette (foreground)\n");
    for my $bg (@SAMPLES) {
        for my $i (0 .. $#RGB) {
            if (($i % 18) == 0) {
                printf_checked("%s\nbg %03d %s",
                    color('reset'), $bg, color("on_rgb$bg"));
            }
            printf_checked('%s%03d ', color("rgb$RGB[$i]"), $RGB[$i]);
        }
    }
    print_checked(color('reset'), "\n\n");
    return;
}
 
# Print out the test file that tries all valid RGB background colors.
#
# Returns: undef
#  Throws: Text exception on I/O failure
sub print_bg256_test {
    print_checked("RGB000 - RGB555 from 256-color palette (background)\n");
    for my $fg (@SAMPLES) {
        for my $i (0 .. $#RGB) {
            if (($i % 18) == 0) {
                printf_checked("%s\nfg %03d %s",
                    color('reset'), $fg, color("rgb$fg"));
            }
            printf_checked('%s%03d ', color("on_rgb$RGB[$i]"), $RGB[$i]);
        }
    }
    print_checked(color('reset'), "\n\n");
    return;
}
 
# Print out the test file that shows all valid grey-scale colors.
#
# Returns: undef
#  Throws: Text exception on I/O failure
sub print_grey_test {
    print_checked("Grey0 - Grey23 from 256-color palette\n\n");
    for my $bg (0 .. 23) {
        printf_checked('%2d %s', $bg, color("on_grey$bg"));
        for my $fg (0 .. 23) {
            printf_checked('%s%d ', color("grey$fg"), $fg);
        }
        print_checked(color('reset'), "\n");
    }
    print_checked("\n");
    return;
}
 
# Print out the test file that shows the 16 ANSI colors from the 256-color
# palette.
#
# Returns: undef
#  Throws: Text exception on I/O failure
sub print_ansi256_test {
    print_checked("ANSI colors 0 - 15 from 256-color palette\n\n");
    for my $bg (0 .. 15) {
        printf_checked('%2d %s', $bg, color("on_ansi$bg"));
        for my $fg (0 .. 15) {
            printf_checked('%s%d ', color("ansi$fg"), $fg);
        }
        print_checked(color('reset'), "\n");
    }
    print_checked("\n");
    return;
}
 
# Main routine.  Scan @ARGV for which test files to print out.
my %tests = (
    basic   => \&print_basic_test,
    bright  => \&print_bright_test,
    fg256   => \&print_fg256_test,
    bg256   => \&print_bg256_test,
    grey    => \&print_grey_test,
    ansi256 => \&print_ansi256_test,
);
for my $file (@ARGV) {
    if ($tests{$file}) {
        $tests{$file}->();
    } else {
        die "Unknown test file: $file\n";
    }
}
 
__END__
