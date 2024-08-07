defmodule SKOS.Concept do
  @moduledoc """
  A Grax schema struct for `skos:Concept`s.

  See <https://www.w3.org/TR/skos-reference/#concepts>.
  """

  use Grax.Schema

  schema SKOS.Concept < SKOS.Resource do
    link broader: SKOS.broader(), type: list_of(SKOS.Concept)
    link narrower: SKOS.narrower(), type: list_of(SKOS.Concept)
    link related: SKOS.related(), type: list_of(SKOS.Concept)

    link broad_matches: SKOS.broadMatch(), type: list_of(SKOS.Concept)
    link narrow_matches: SKOS.narrowMatch(), type: list_of(SKOS.Concept)
    link related_matches: SKOS.relatedMatch(), type: list_of(SKOS.Concept)
    link exact_matches: SKOS.exactMatch(), type: list_of(SKOS.Concept)
    link close_matches: SKOS.closeMatch(), type: list_of(SKOS.Concept)

    link top_concept_of: SKOS.topConceptOf(), type: list_of(SKOS.ConceptScheme)
    link in_schemes: SKOS.inScheme(), type: list_of(SKOS.ConceptScheme)
  end
end
