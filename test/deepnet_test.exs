defmodule DeepnetTest do
  use ExUnit.Case
  doctest Deepnet

  test "greets the world" do
    assert Deepnet.hello() == :world
  end
end
