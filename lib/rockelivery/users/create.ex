defmodule Rockelivery.Users.Create do
  alias Rockelivery.Users.User
  alias Rockelivery.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
