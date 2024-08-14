defmodule Cache.Impl.Cache do
  def cache() do
    %{0 => 0, 1 => 1}
  end

  def get_cache(map, n) do
    map[n]
  end
end
