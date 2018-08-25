defmodule Deepnet do
  @moduledoc """
  Documentation for Deepnet.
  """

  @doc """
  Starts DeepNet
  """

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Deepnet.Network, [3, 3, 3], [function: :create]),
    ]

    opts = [strategy: :one_for_one, name: Deepnet.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
