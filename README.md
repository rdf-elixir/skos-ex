[![Hex.pm](https://img.shields.io/hexpm/v/skos.svg?style=flat-square)](https://hex.pm/packages/skos)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/skos/)
[![License](https://img.shields.io/hexpm/l/skos.svg)](https://github.com/rdf-elixir/skos-ex/blob/master/LICENSE.md)


# SKOS.ex

An implementation of the [W3C Simple Knowledge Organization System (SKOS)](http://www.w3.org/TR/skos-primer) vocabulary for Elixir as Grax schemas.

The API documentation can be found [here](https://hexdocs.pm/skos/).
For more information about the RDF on Elixir projects, go to <https://rdf-elixir.dev>.


## Features

- The `SKOS` module acts as the `RDF.Vocabulary.Namespace` for the SKOS vocabulary
- Grax structures for all SKOS classes and their properties, for easy
  creation and manipulation of SKOS concepts, concept schemes, and collections
- Seamless integration with all RDF on Elixir projects


## Installation

Add `skos` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:skos, "~> 0.1"}
  ]
end
```

## Usage

```elixir
SKOS.Concept.build!(EX.elixir(),
  pref_label: "Elixir",
  alt_label: ["Elixir language", "Elixir lang"],
  definition: "Elixir is a dynamic, functional language for building scalable and maintainable applications.",
  broader: [EX.programming_language()],
  related: [EX.erlang(), EX.beam()]
)  
|> Grax.to_rdf!(prefixes: [skos: SKOS, ex: EX])  
|> RDF.Turtle.write_string!()
```

produces:

```turtle
@prefix ex: <http://example.com/concepts/> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .

ex:elixir
    a skos:Concept ;
    skos:altLabel "Elixir lang", "Elixir language" ;
    skos:broader ex:programming_language ;
    skos:definition "Elixir is a dynamic, functional language for building scalable and maintainable applications." ;
    skos:prefLabel "Elixir" ;
    skos:related ex:beam, ex:erlang .
```


## Limitations

- `skos:OrderedCollection` is not yet supported


## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for details.


## Consulting

If you need help with your Elixir and Linked Data projects, just contact [NinjaConcept](https://www.ninjaconcept.com/) via <contact@ninjaconcept.com>.


## License and Copyright

(c) 2024 Marcel Otto. MIT Licensed, see [LICENSE](LICENSE.md) for details.
