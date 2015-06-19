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

  test "it can be written to" do
    {:ok, _tmp, path} = Tempfile.open
    :ok = File.write path, "foo"
    assert {:ok, "foo"} = File.read path
  end

  test "the permissions are 600" do
    {:ok, _tmp, path} = Tempfile.open
    permissions = :os.cmd('/usr/bin/ls -l #{path} | cut -d\' \' -f1')
    assert String.match? to_string(permissions), ~r/\-rw\-\-\-\-\-\-\-\n/
  end

end
