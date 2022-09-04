defmodule HelloWeb.HelloView do
  use HelloWeb, :view

  def render("post.json", %{posts: posts}) do
    %{status: "ok", data: render_many(posts, HelloWeb.HelloView, "data.json")}
  end

  def render("ping.json", %{data: data}) do
    %{status: "ok", data: render_one(data, HelloWeb.HelloView, "data.json")}
  end

  def render("data.json", %{hello: data}) do
    data.title
  end
end
