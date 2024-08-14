defmodule CachedfibTest do
  use ExUnit.Case
  doctest Cachedfib

  test "greets the world" do
    assert Cachedfib.hello() == :world
  end
end
