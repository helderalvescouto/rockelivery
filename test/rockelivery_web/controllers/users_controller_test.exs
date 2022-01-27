defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, returns the user", %{conn: conn} do
      params = %{
        "address" => "Rua das bananeiras, 25",
        "age" => 27,
        "cep" => "38408250",
        "cpf" => "12345678901",
        "email" => "vanessa@banana.com",
        "password" => "123456",
        "name" => "Vanessa da Silva"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua das bananeiras, 25",
                 "age" => 27,
                 "cep" => "38408250",
                 "cpf" => "12345678901",
                 "email" => "vanessa@banana.com",
                 "id" => _id,
                 "name" => "Vanessa da Silva"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Vanessa da Silva"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"address" => ["can't be blank"], "age" => ["can't be blank"], "cep" => ["can't be blank"], "cpf" => ["can't be blank"], "email" => ["can't be blank"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "f07486e0-5a2c-4740-b50a-2423a29da05a"

      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
