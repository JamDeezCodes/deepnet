defmodule Deepnet.Network do
  use Application
  
  @moduledoc """
  `Deepnet` is a 3 layered neural network architecture fully implemented in Elixir.
  It utilizes an Elixir agent to store the state of the process that is working
  on a particular problem. This project is associated with the post on
  Automating The Future regarding multi layered neural networks in Elixir.
  """

  defstruct [
    learning_rate: nil,
    input_nodes: nil,
    hidden_nodes: nil,
    output_nodes: nil,
    weights: nil,
    error_rate: nil,
    target: nil
  ]
  
  @doc """
  Creates the neural network. This function is called at startup by the project
  supervisor.
  # PARAMETERS
  - `input_nodes`: Integer.t()  number of inputs
  - `hidden_nodes`: Integer.t() number of neurons in the hidden layer
  - `output_nodes`: Integer.t() number of neurons in the output layer
  - `learning_rate`: Float.t()  rate at which the network learns. Default set to 1.0
  """
  def create(
    input_nodes,
    hidden_nodes,
    output_nodes,
    learning_rate \\ 1.0) when is_number(input_nodes)
                          and  is_number(hidden_nodes)
                          and  is_number(output_nodes)
                          and  is_float(learning_rate) do

    Agent.start_link(fn() ->
      %Deepnet.Network{
        learning_rate: learning_rate,
        input_nodes: input_nodes,
        hidden_nodes: hidden_nodes,
        output_nodes: output_nodes,
      }
      end, [name: __MODULE__])
  end
end