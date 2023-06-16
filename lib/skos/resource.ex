defmodule SKOS.Resource do
  @moduledoc """
  A Grax schema struct for all general SKOS properties.

  All of these properties are inherited to all the other schemas.
  """

  use Grax.Schema

  schema do
    property pref_label: SKOS.prefLabel(), type: :string
    property alt_label: SKOS.altLabel(), type: list_of(:string)
    property hidden_label: SKOS.hiddenLabel(), type: list_of(:string)

    property notation: SKOS.notation(), type: list_of(:any)

    property note: SKOS.note(), type: list_of(:any)
    property definition: SKOS.definition(), type: list_of(:any)
    property example: SKOS.example(), type: list_of(:any)
    property change_note: SKOS.changeNote(), type: list_of(:any)
    property editorial_note: SKOS.editorialNote(), type: list_of(:any)
    property history_note: SKOS.historyNote(), type: list_of(:any)
    property scope_note: SKOS.scopeNote(), type: list_of(:any)
  end
end
