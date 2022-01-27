defmodule Rockelivery.Factory do
  use ExMachina

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
end
