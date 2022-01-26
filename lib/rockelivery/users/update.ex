defmodule Rockelivery.Users.Update do
  alias Rockelivery.Users.User
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}

  def call(%{"id" => id} = params) do
    id
    |> UUID.cast()
    |> update(params)
  end

  defp update(:error, _params), do: {:error, Error.build_id_format_error()}

  defp update({:ok, id}, params) do
    User
    |> Repo.get(id)
    |> handle_update(params)
  end

  defp handle_update(nil, _params), do: {:error, Error.build_user_not_found_error()}

  defp handle_update(user, params), do: do_update(user, params)

  defp do_update(%User{} = user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
