defmodule Cache.Runtime.Server do
  @moduledoc """
  We implement a simple key/value cache. State is stored in an Agent, in
  the form of a map.

  The function `lookup` tries to look the value up in the cache, and then
  calls `complete_if_not_found`. This takes two forms. If there was
  no value in the cache, it calls the function passed in by the client
  to supply it, updating the cache at the same time.

  Otherwise, it simply returns the cached value.
  """

  @doc """
  Start the cache, run the supplied function, then stop the cache.

  Eventually we'll be able to do better than this.
  """
  alias Cache.Impl.Cache
  @me __MODULE__

  use Agent

  def start_link(_opts) do
    Agent.start_link(&Cache.cache/0, name: @me)
  end

  def lookup(n, if_not_found) do
    Agent.get(@me, fn map -> Cache.get_cache(map, n) end)
    |> complete_if_not_found(n, if_not_found)
  end

  defp complete_if_not_found(nil, n, if_not_found) do
    if_not_found.()
    |> set(n)
  end

  defp complete_if_not_found(value, _n, _if_not_found) do
    value
  end

  defp set(val, n) do
    Agent.get_and_update(@me, fn map ->
      {val, Map.put(map, n, val)}
    end)
  end
end
