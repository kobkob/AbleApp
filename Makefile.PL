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
        #'ABC'              => '1.6',
        #'Foo::Bar::Module' => '5.0401',
        DBIx::Class         => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'App-Able-*' },
    EXE_FILES => ["bin/abl"]
);

package MY;
use File::ShareDir::Install qw(postamble);
