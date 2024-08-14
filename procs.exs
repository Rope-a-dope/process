defmodule Procs do
  def greeter(count) do
    receive do
      {:crash, reason} ->
        exit(reason)

      {:quit} ->
        IO.puts("I'm outta here!")

      {:add, n} ->
        greeter(count + n)

      {:reset} ->
        IO.puts("reset count to 0")
        greeter(0)

      msg ->
        IO.puts("#{count}: #{msg}")
        greeter(count)
    end
  end
end
