defmodule Rockelivery.ViaCep.Client do
  use Tesla

  alias Tesla.Env
  alias Rockelivery.Error
  alias Rockelivery.ViaCep.Behaviour

  @behaviour Behaviour

  @base_url "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON

  def get_cep_info(url \\ @base_url, cep) do
    "#{url}#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => true}}}) do
    {:error, Error.build_cep_not_found_error()}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}), do: {:ok, body}

  defp handle_get({:ok, %Env{status: 400, body: _body}}) do
    {:error, Error.build_invalid_cep_error()}
  end

  defp handle_get({:error, reason}),
    do: {:error, Error.build_invalid_format_cep_error(:bad_request, reason)}
end
