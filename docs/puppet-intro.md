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

```
# Install requisites for hosting a static site
class statichost::install (
  String $param = 'default',
) {
  package { 'the-thing':
    ensure => 'installed',
  }
}
```

[Puppet docs: Classes](https://www.puppet.com/docs/puppet/latest/lang_classes.html)

#### Types

```
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
```

[Puppet docs: Defined resource types](https://www.puppet.com/docs/puppet/latest/lang_defined_types.html)
