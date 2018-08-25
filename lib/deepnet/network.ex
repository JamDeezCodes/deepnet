defmodule Deepnet.Network do
  @moduledoc """
  The network module is the where all the work for the neural network is done.
  The Network itself is based on a 3 x 3 artchitecture which is a standard basic
  Deep Learning Neural Network that can be utilized for a wide number of problems.
  It is responsible for creating and training itself. toward the specified target
  The Network needs 7 items to get started, but neural networks are not limited
  to these 7.
  - `Learning Rate`:
    A rate of change constant the network uses to improve itself throughout the life cycle.
    Every time a cycle/epoch is completed the neural network will use this constant
    in the calculation during weight adjustment.
  - `Input Nodes`:
    The amount of inputs that will be considered during training.
  - `Hidden Nodes`:
    The amount of nodes that will be present in the hidden layer of the network.
  - `Output Nodes`:
    The number of outputs the neural network will create.
  - `Weights`:
    The randomized floating point integers between 0 and 1 used for calculations
  - `Error Rate`:
    The overal Error of the Neural Network. Serves as feedback for the Network
    so as to know how well it's learning.
  - `Target`:
    The goal, or endpoint for the neural network to acheive.
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