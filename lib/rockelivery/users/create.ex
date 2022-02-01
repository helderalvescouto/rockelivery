defmodule Rockelivery.Users.Create do
  alias Rockelivery.Users.User
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.ViaCep.Client

  def call(params) do
    cep = Map.get(params, "get")
    changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- Client.get_cep_info(cep),
         {:ok, %User{} = user} <- Repo.insert(changeset) do
      {:ok, user}
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
