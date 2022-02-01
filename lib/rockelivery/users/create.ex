defmodule Rockelivery.Users.Create do
  alias Rockelivery.Users.User
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.ViaCep.Client

  def call(%{"cep" => cep} = params) do
    # case Client.get_cep_info(cep) do
    #   {:ok, _cep_info} -> create_user(params)
    #   {:error, _result} = error -> error
    # end
    with {:ok, %User{} = user} <- User.build(params),
         {:ok, _cep_info} <- Client.get_cep_info(cep) do
      Repo.insert(user)
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  # defp create_user(params) do
  #   params
  #   |> User.changeset()
  #   |> Repo.insert()
  #   |> handle_insert()
  # end

  # defp handle_insert({:ok, %User{}} = result), do: result

  # defp handle_insert({:error, result}) do
  #   {:error, Error.build(:bad_request, result)}
  # end
end
