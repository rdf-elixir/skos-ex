defmodule SKOS.Collection do
  @moduledoc """
  A Grax schema struct for `skos:Collection`s.

  See <https://www.w3.org/TR/skos-reference/#collections`.
  """

  use Grax.Schema

  schema SKOS.Collection < SKOS.Resource do
    link members: SKOS.member(),
         type:
           list_of(%{
             # Since we don't have support for reasoning, we assume every member
             # which is not explicitly typed as a skos:Collection is a skos:Concept
             # for practical reasons.
             nil => SKOS.Concept,
             SKOS.Collection => SKOS.Collection
           })
  end
end
