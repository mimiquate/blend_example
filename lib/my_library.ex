defmodule MyLibrary do
  @moduledoc """
  Documentation for `MyLibrary`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MyLibrary.hello()
      :world

  """

  require Logger

  def hello do
    :world
  end

  def encrypt_hello do
    Logger.info("Plug Crypto version: #{Application.spec(:plug_crypto, :vsn)}")

    Plug.Crypto.encrypt("key_base", "secret", hello())
  end

  def decrypt_hello(token) do
    Plug.Crypto.decrypt("key_base", "secret", token)
  end
end
