defmodule Rockelivery.Users.Get do
  alias Rockelivery.Users.User
  alias Ecto.UUID
  alias Rockelivery.Repo

  def by_id2(id) do
    with {:ok, uuid} <- UUID.cast(id),
         %User{} = user <- Repo.get(User, uuid) do
      {:ok, user}
    else
      :error -> {:error, %{status: :bad_request, result: "Invalid ID format!"}}
      nil -> {:error, %{status: :not_found, result: "User not found!"}}
    end
  end

  def by_id(id) do
    id
    |> UUID.cast()
    |> get()
  end

  defp get(:error), do: {:error, %{status: :bad_request, result: "Invalid ID format!"}}

  defp get({:ok, uuid}) do
    User
    |> Repo.get(uuid)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, %{status: :not_found, result: "User not found!"}}

  defp handle_get(user), do: {:ok, user}
end
