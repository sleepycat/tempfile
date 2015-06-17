require Random

defmodule Tempfile do

  def open do
    path = Path.join([System.tmp_dir!, generate_filename])
    {:ok, file} = File.open(path, [:read, :write, :exclusive])
    :ok = File.chmod!(path, 0o600)
    {:ok, file, path}
  end

  def close file do
    File.close file
  end

  def generate_filename do
    Random.selections(chars, 32) <> ".tmp"
  end

  def generate_filename prefix: prefix do
    prefix <> "_" <> Random.selections(chars, 32) <> ".tmp"
  end

  def generate_filename extension: ext do
    Random.selections(chars, 32) <> ext
  end

  def generate_filename prefix: pre, extension: ext do
    pre <> "_" <> Random.selections(chars, 32) <> ext
  end

  defp chars do
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  end

end
