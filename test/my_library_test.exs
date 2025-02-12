defmodule MyLibraryTest do
  use ExUnit.Case
  doctest MyLibrary

  test "greets the world" do
    assert MyLibrary.hello() == :world
  end

  test "greets the world encrypted and decrypted" do
    assert MyLibrary.encrypt_hello() |> MyLibrary.decrypt_hello() == {:ok, :world}
  end
end
