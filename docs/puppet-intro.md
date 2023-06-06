# An Introduction to Puppet

This is not going to be a full tutorial to the entire puppet language. This is
meant to cover some of the fundamentals so that new developers aren't
completely lost.

## Puppet language fundamentals

The Puppet DSL is:

- Bracey
- Has $Variables
- Declarative, not imperative

### Top-level constructs

The two major kinds of things defined by puppets are classes and types. Classes
can only included or not included. Types define a resource and can be created
many times for different instances of that resource.

There also exist plans, but these are only for [Bolt](https://www.puppet.com/docs/bolt/latest/bolt.html),
which we're not using right now.

#### Classes

    # Install requisites for hosting a static site
    class statichost::install (
      String $param = 'default',
    ) {
      package { 'the-thing':
        ensure => 'installed',
      }
    }

This is a singleton, either included in the system configuration or not.

[Puppet docs: Classes](https://www.puppet.com/docs/puppet/latest/lang_classes.html)

#### Types

    # Define a staticly hosted site
    define statichost::site (
      String $hostname = $title,
      String $source
    ) {
      archive { "/srv/${hostname}":
        source => $source
      }
      file { "/etc/caddy/${hostname}.caddy":
        content => "..."
      }
    }

[Puppet docs: Defined resource types](https://www.puppet.com/docs/puppet/latest/lang_defined_types.html)

## Ordering

Note that while the data manipulation parts of Puppet are imperative, the
resources the code defines may not be applied in the order given. The engine is
allowed to reorder or parallelize operations as it sees fit. If there is a
dependency between two resources, it must be given.

## Identifiers

Identifiers have both a capitalized and uncapitalized form, depending on the context.

Generally, you will refer to the instance of a class (a specific resource) in
lower case, but the class itself in uppercase.

For this reason, many identifiers must start with a lower case letter.

So `mymod::thingy` would become `Mymod::Thingy`.

[Puppet docs: Reserved words and acceptable names](https://www.puppet.com/docs/puppet/latest/lang_reserved.html)

## Titles and namevars

Take this:

    thingy { 'something':
      foo    => "bar",
      answer => 42,
    }

To break it down:

- `thingy` is the class being referenced, the resource type
- `something` is the title and the name, assigned to the namevar
- `foo` and `anser` are parameters

`$title` and `$name` are reserved variables for the above reason.
"namevar" is a term used in the docs for the parameter that accepts
the name. It is possible to explicitly set the namevar, in which
case the name and the title can differ.

[Puppet docs: Defined resource types: `$title` and `$name`](https://www.puppet.com/docs/puppet/latest/lang_defined_types.html#title-and-name)

## File Structure

TODO: Write this
