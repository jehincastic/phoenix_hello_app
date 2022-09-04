defmodule HelloWeb.PageView do
  use HelloWeb, :view
  use Phoenix.Component

  def class(), do: "text-red-500"

  def city(assigns) do
    ~H"""
    The chosen city is: <%= @name %>.
    """
  end

end
