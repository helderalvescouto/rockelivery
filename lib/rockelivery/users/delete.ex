defmodule Rockelivery.Users.Delete do
  alias Rockelivery.Users.User
  alias Ecto.UUID
  alias Rockelivery.Repo

  def call(id) do
    id
    |> UUID.cast()
    |> delete()
  end

  defp delete(:error), do: {:error, %{status: :bad_request, result: "Invalid ID format!"}}

  defp delete({:ok, uuid}) do
    User
    |> Repo.get(uuid)
    |> handle_delete()
  end

  defp handle_delete(nil), do: {:error, %{status: :not_found, result: "User not found!"}}

  defp handle_delete(user), do: Repo.delete(user)
end
