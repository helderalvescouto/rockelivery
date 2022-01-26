defmodule Rockelivery.Users.Delete do
  alias Rockelivery.Users.User
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo}

  def call(id) do
    id
    |> UUID.cast()
    |> delete()
  end

  defp delete(:error), do: {:error, Error.build_id_format_error()}

  defp delete({:ok, uuid}) do
    User
    |> Repo.get(uuid)
    |> handle_delete()
  end

  defp handle_delete(nil), do: {:error, Error.build_user_not_found_error()}

  defp handle_delete(user), do: Repo.delete(user)
end
