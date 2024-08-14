defmodule Cache do
  @moduledoc """
  This module provides a public API for interacting with the cache.
  """

  alias Cache.Runtime.Server

  @doc """
  Looks up a value in the cache by the given key. If the key is not found,
  it will use the provided function to compute the value and store it in the cache.
  """
  def lookup(key, if_not_found) do
    Server.lookup(key, if_not_found)
  end
end
