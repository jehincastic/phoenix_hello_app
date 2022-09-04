defmodule HelloWeb.FallbackController do
  use HelloWeb, :controller

  # If error occurs this handler will be called
  action_fallback HelloWeb.MyFallbackController

  def getData(data) do
    case data do
      "hello" ->
        {:ok, "world"}
      "bye" ->
        {:ok, "..."}
      "unauthorized" ->
        {:error, :unauthorized}
      _ ->
        {:error, :not_found}
    end
  end

  def index(conn, %{"data" => data}) do
    with {:ok, value} <- getData(data) do
      render(conn, "index.html", [data: value])
    end
  end
end
