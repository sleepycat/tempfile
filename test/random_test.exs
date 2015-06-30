defmodule TempfileRandomTest do
  use ExUnit.Case

  setup do
    # :random.seed returns a default value unless you pass it data.
    {:ok, seed: :random.seed }
  end

  test "it randomly selects from the given set of characters" do
    assert Tempfile.Random.selections("a", 1) == "a"
  end

  test "it returns the number of characters requested", context do
    assert Tempfile.Random.selections("abc123", 10, context[:seed]) == "c231b132c1"
  end

end
