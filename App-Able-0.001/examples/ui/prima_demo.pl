#!/usr/bin/env perl
use Prima;
use Prima::Application;
use Prima::ComboBox;

$mw = Prima::MainWindow->create (
        # here there are some options, mainly that more common:
        size => [400,400],
        menuItems => [[ "~File" => [
        [],# division line
        [ "E~xit" => "Exit"    ]
        ]]],
        # events
        onPaint => sub {
        my ($self, $canvas) = @_;
        $canvas-> clear;
        $canvas-> color(cl::Red);
        $canvas-> line( 0, 0, 800, 800);
        });
$mw->insert('ComboBox',
        name => 'ComboBox',
        size => [ 100, 100],
       );
run Prima;
