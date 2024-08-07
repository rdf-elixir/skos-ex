defmodule SKOS do
  @moduledoc """
  Implementation of the Simple Knowledge Organization System (SKOS) vocabulary.

  The following features are provided:

  - The `SKOS` module acts as the `RDF.Vocabulary.Namespace` for the SKOS vocabulary.
  - Grax structures for all SKOS classes and their properties are defined, namely:
    - `SKOS.Concept`
    - `SKOS.ConceptScheme`
    - `SKOS.Collection`

  Note: `skos:OrderedCollection` is not yet supported.

  See <http://www.w3.org/TR/skos-primer>.
  """

  import RDF.Namespace

  act_as_namespace RDF.NS.SKOS
end
