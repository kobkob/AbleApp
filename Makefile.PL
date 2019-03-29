use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;
use File::ShareDir::Install;
 
install_share module => 'App::Able' => 'assets';

WriteMakefile(
    NAME             => 'App::Able',
    AUTHOR           => q{Monsenhor <filipo@kobkob.org>},
    VERSION_FROM     => 'lib/App/Able.pm',
    ABSTRACT_FROM    => 'lib/App/Able.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More' => '0',
    },
    PREREQ_PM => {
        DBIx::Class       => 0,
        Data::Dumper      => 0,
        Data::Section     => 0,
        File::Util        => 0,
        File::Spec        => 0,
        File::Copy        => 0,
        File::Basename    => 0,
        File::ShareDir    => 0,
        Getopt::Long      => 0,
        Config::YAML      => 0,
        Git::Repository   => 0,
        Pod::Usage        => 0,
        Try::Tiny         => 0,
        Term::ANSIColor   => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'App-Able-*' },
    EXE_FILES => ["bin/abl"]
);

package MY;
use File::ShareDir::Install qw(postamble);
