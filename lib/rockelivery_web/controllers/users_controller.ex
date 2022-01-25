defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller

  def create(conn, params) do
    conn
    |> Rockelivery.create_user(params)
  end
end
