defmodule Rockelivery.Users.Get do
  alias Rockelivery.Users.User
  # alias Ecto.UUID
  alias Rockelivery.{Error, Repo}

  # def by_id2(id) do
  #   with {:ok, uuid} <- UUID.cast(id),
  #        %User{} = user <- Repo.get(User, uuid) do
  #     {:ok, user}
  #   else
  #     :error -> {:error, Error.build_id_format_error()}
  #     nil -> {:error, Error.build_user_not_found_error()}
  #   end
  # end

  def get(id) do
    User
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, Error.build_user_not_found_error()}

  defp handle_get(user), do: {:ok, user}
end
