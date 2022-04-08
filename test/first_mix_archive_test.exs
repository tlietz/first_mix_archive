defmodule FirstMixArchiveTest do
  use ExUnit.Case
  doctest FirstMixArchive

  test "greets the world" do
    assert FirstMixArchive.hello() == :world
  end
end
