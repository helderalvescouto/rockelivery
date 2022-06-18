defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"

    response = render(UsersView, "create.json", token: token, user: user)

    expected_response = %{
      message: "User created!",
      token: "xpto1234",
      user: %Rockelivery.Users.User{
        address: "Rua das bananeiras, 25",
        age: 27,
        cep: "38408250",
        cpf: "12345678901",
        email: "vanessa@banana.com",
        id: "f07486e0-5a2c-4740-b50a-2423a29da05a",
        inserted_at: nil,
        name: "Vanessa da Silva",
        password: "123456",
        password_hash: nil,
        updated_at: nil
      }
    }

    assert response == expected_response
  end
end
