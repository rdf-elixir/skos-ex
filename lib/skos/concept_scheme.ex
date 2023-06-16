defmodule SKOS.ConceptScheme do
  @moduledoc """
  A Grax schema struct for `skos:ConceptScheme`s.

  See <https://www.w3.org/TR/skos-reference/#schemes`.
  """

  use Grax.Schema

  schema SKOS.ConceptScheme < SKOS.Resource do
    link top_concepts: SKOS.hasTopConcept(), type: list_of(SKOS.Concept)
  end
end
