defmodule Rockelivery.Users.Delete do
  alias Rockelivery.Users.User
  alias Rockelivery.{Error, Repo}

  def call(id) do
    User
    |> Repo.get(id)
    |> handle_delete()
  end

  defp handle_delete(nil), do: {:error, Error.build_user_not_found_error()}

  defp handle_delete(user), do: Repo.delete(user)
end
