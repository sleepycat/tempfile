Tempfile
========

As the name suggests this library creates tempfiles for Elixir.

```elixir
{:ok, tempfile} = Tempfile.open
:ok = Tempfile.close(tmp)
```

The file/pid returned from Tempfile.open is created with :read, :write
and :exclusive modes. Permissions are set to 600 and the file is created
in whatever directory is returned by System.tmp_dir.

## TODO
* Experiment with using unshare to create a namespaced private /tmp
* expose options for custom prefix/extensions
* proper documentation
