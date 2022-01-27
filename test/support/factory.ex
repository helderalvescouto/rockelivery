defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.Users.User
  def user_params_factory do
    %{
      address: "Rua das bananeiras, 25",
      age: 27,
      cep: "38408250",
      cpf: "12345678901",
      email: "vanessa@banana.com",
      password: "123456",
      name: "Vanessa da Silva"
    }
  end

  def user_factory do
    %User{
      address: "Rua das bananeiras, 25",
      age: 27,
      cep: "38408250",
      cpf: "12345678901",
      email: "vanessa@banana.com",
      password: "123456",
      name: "Vanessa da Silva",
      id: "f07486e0-5a2c-4740-b50a-2423a29da05a"
    }
  end
end
