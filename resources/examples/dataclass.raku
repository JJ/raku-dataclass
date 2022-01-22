#!/usr/bin/env raku

use MetamodelX::Dataclass;

dataclass Foo {
    has $.bar;
    has $.baz = 33;
}

my $foo = Foo.new(:3bar);

say $foo.bar;

try {
    my $dataclass = MetamodelX::Dataclass.new_type( :name("Bar") );
    $dataclass.^add_method( 'bar', -> { "Won't work" });
    $dataclass.^compose();
    CATCH {
        default {
            $*ERR.say: .message;
        }
    }
}
