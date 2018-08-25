# Deepnet

**Following along here: http://www.automatingthefuture.com/blog/2017/2/20/deep-learning-building-and-training-a-multi-layered-neural-network-in-elixir**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `deepnet` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:deepnet, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/deepnet](https://hexdocs.pm/deepnet).

## Steps

To fire up the neural network, run:

```iex -S mix```

Then run this command to initialize the weights:

```Deepnet.Network.initialize_weights```

When you run the following command, you should see the network's randomized weights in the struct:

```Deepnet.Network.get```