# Dataclasses in Raku

Dataclasses have all the mechanisms that classes have (can be inherited, 
have accessors), but they don't have any method. Inspired by [Python 
dataclasses](https://docs.python.org/3/library/dataclasses.html). With 
private instance variables, they will be effectively frozen.

There's probably an use case for this somewhere, but this was created mainly 
to illustrate the metamodel.

## Installing

    zef install dataclass

## Running

Pretty much as any other class... Except no methods:

```raku
use lib ".";

use Dataclass;

dataclass Foo {
    has $.bar;
    has $.baz = 33;
}

my $foo = Foo.new(:3bar);

say $foo.bar;
```

Check out also the [`resources/examples`](resources/examples) directory for 
(possibly) more examples and a negative example.

A `dataclass` will not compile if it's got any method, and will throw if a 
method is added to it dynamically.

## See also

There's not a lot of information about the Metamodel in the documentation, 
but you can check out [the docs for `ClassHOW`](https://docs.raku.
org/type/Metamodel::ClassHOW).

## License
<-- 
This module will be licensed, by default, under the Artistic 2.0 License (the same as Raku itself). You can change it by using a different LICENSE file, as well as changing the license field in META6.json -->
