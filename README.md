Tempfile
========

As the name suggests this library creates tempfiles for Elixir.

```elixir
{:ok, tempfile, path} = Tempfile.open
# {:ok, #PID<0.112.0>, "/tmp/wn0FE2xHiJiX32pE4fRwcthuQxRtSdU3.tmp"}
:ok = Tempfile.close(tmp)
```

The file/pid returned from Tempfile.open is created with :read and
:write modes.  Permissions are set to 600 and the file is created in
whatever directory is returned by System.tmp_dir.

## Usage

Just add this repo to your mix.exs and then run mix deps.get
```elixir
  def application do
    [
      #...
      applications: [:tempfile]
    ]
  end

  defp deps do
    [
      #...
      {:tempfile, github: "sleepycat/tempfile"}
    ]
  end
```

## TODO
* Experiment with using unshare to create a namespaced private /tmp
* expose options for custom prefix/extensions
* proper documentation
