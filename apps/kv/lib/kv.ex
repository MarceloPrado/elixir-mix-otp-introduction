defmodule KV do
  use Application

  @moduledoc """
  Documentation for `KV`.
  """

  @impl true
  def start(_type, _args) do
    IO.puts("Starting application...")
    KV.Supervisor.start_link(name: KV.Supervisor)
  end
end
