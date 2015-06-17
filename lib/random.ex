defmodule Random do

  def selections charset, number, seed \\ nil do
    seed_the_prng(seed)
    reduce_function = fn(_, acc) -> acc <> String.at(charset, :random.uniform(String.length(charset))- 1) end
    Enum.reduce(0..number-1, "", reduce_function)
  end

  defp seed_the_prng seed \\ nil do
    if seed == nil do
      :random.seed(pseudo_random_seed)
    else
      :random.seed
    end
  end

  defp pseudo_random_seed do
    << a :: 32, b :: 32, c :: 32 >> = :crypto.rand_bytes(12)
    {a,b,c}
  end

end

