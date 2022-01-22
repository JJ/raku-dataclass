#!/usr/bin/env raku

use Test;
use MetamodelX::Dataclass;

dataclass Foo {
    has $.bar;
    has $.baz = 33;
}

my $foo = Foo.new(:3bar);

isa-ok( $foo, Foo, "Class created OK");
is( $foo.bar, 3, "Setting OK" );
is( $foo.baz, 33, "Default sets OK");

my &throwing-block = {
    my $dataclass = MetamodelX::Dataclass.new_type( :name("Bar") );
    $dataclass.^add_method( 'bar', -> { "Won't work" });
    $dataclass.^compose();
}

throws-like &throwing-block, X::AdHoc, message => /"no methods"/;
