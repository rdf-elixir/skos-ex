defmodule SKOSTest do
  use SKOS.Test.Case

  doctest SKOS

  {properties, classes} = Enum.split_with(RDF.NS.SKOS.__terms__(), &RDF.Utils.downcase?/1)
  @classes classes
  @properties properties

  describe "RDF.Vocabulary.Namespace compatibility" do
    Enum.each(@classes, fn class ->
      test "SKOS.#{class} can be resolved to a RDF.IRI" do
        assert SKOS
               |> Module.concat(unquote(class))
               |> RDF.iri() ==
                 RDF.NS.SKOS
                 |> Module.concat(unquote(class))
                 |> RDF.iri()
      end
    end)

    Enum.each(@properties, fn property ->
      test "SKOS.#{property}/0" do
        assert apply(SKOS, unquote(property), []) ==
                 apply(RDF.NS.SKOS, unquote(property), [])
      end

      test "SKOS.#{property}/2" do
        assert apply(SKOS, unquote(property), [EX.S, EX.O]) ==
                 apply(RDF.NS.SKOS, unquote(property), [EX.S, EX.O])
      end

      test "SKOS.#{property}/1" do
        o = RDF.iri(EX.O)
        desc = apply(RDF.NS.SKOS, unquote(property), [EX.S, o])
        assert apply(SKOS, unquote(property), [desc]) == [o]
      end
    end)

    test "__file__/0" do
      assert SKOS.__file__() == RDF.NS.SKOS.__file__()
    end
  end
end
