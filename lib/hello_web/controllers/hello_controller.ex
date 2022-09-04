defmodule HelloWeb.HelloController do
  use HelloWeb, :controller
  alias Hello.User
  # This uses the plug only for index action
  # plug HelloWeb.Plugs.Locale, "en" when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", [messenger: messenger])
    # or
    # assign is from Plug.Conn
    # conn
    # |> assign(:messenger, messenger)
    # |> render("show.html")
  end

  def ping(conn, _params) do
    data = %{title: "pong"}
    render(conn, "ping.json", data: data)
  end

  def post(conn, _params) do
    posts = [%{title: "foo"}, %{title: "bar"}]
    render(conn, "post.json", posts: posts)
  end

  def create(conn, _params) do
    changeset = User.changeset(%User{}, conn.body_params)
    if !changeset.valid? do
      IO.inspect changeset.errors
      json(conn, %{error: "Invalid data"})
    else
      Repo.insert(changeset)
      json(conn, %{status: "success"})
    end
  end
end
