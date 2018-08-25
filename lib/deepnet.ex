defmodule Deepnet do
  use Application
  
  @moduledoc """
  `Deepnet` is a 3 layered neural network architecture fully implemented in Elixir.
  It utilizes an Elixir agent to store the state of the process that is working
  on a particular problem. This project is associated with the post on
  Automating The Future regarding multi layered neural networks in Elixir.
  """

  defstruct [
    user_input[[1, 0, 0], [1, 0, 1]],
    desired_target: [1, 1, 1]
  ]

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
