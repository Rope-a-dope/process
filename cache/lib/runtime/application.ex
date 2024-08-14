defmodule Cache.Runtime.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Cache.Runtime.Server, []}
    ]

    opts = [name: Cache.Runtime.Supervisor, strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end
end
