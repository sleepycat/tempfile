require IEx

defmodule TempfileTest do
  use ExUnit.Case

  test "it generates a filename" do
    name = Tempfile.generate_filename
    assert String.match? name, ~r/\A\w{32}.tmp\z/
  end

  test "it accepts a prefix for the filename" do
    name = Tempfile.generate_filename(prefix: "foo")
    assert String.match? name, ~r/\Afoo_\w{32}.tmp\z/
  end

  test "it accepts a file extension for the tempfile" do
    name = Tempfile.generate_filename(extension: ".foo")
    assert String.match? name, ~r/\A\w{32}.foo\z/
  end

  test "it accepts both and extention and a prefix" do
    name = Tempfile.generate_filename(prefix: "foo", extension: ".bar")
    assert String.match? name, ~r/\Afoo_\w{32}.bar\z/
  end

  test "it has and open function" do
    assert {:ok, _fd, _path} = Tempfile.open
  end

  test "it can be closed after opening" do
    {:ok, tmp, _path} = Tempfile.open
    assert :ok = Tempfile.close(tmp)
  end

end
