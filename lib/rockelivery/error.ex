defmodule Rockelivery.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_user_not_found_error, do: build(:not_found, "User not found!")

  @spec build_cep_not_found_error :: %Rockelivery.Error{result: any, status: any}
  def build_cep_not_found_error, do: build(:not_found, "CEP not found!")

  def build_invalid_cep_error, do: build(:bad_request, "Invalid CEP!")

  def build_invalid_format_cep_error(status, result), do: build(status, result)
end
