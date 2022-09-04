defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render("index.html")
    # render(conn, :index) to handle for both html and text
    # render(conn, "index.html")

    # conn
    # |> put_status(202)
    # |> render("index.html")

    # conn
    # |> put_resp_content_type("text/plain")
    # |> send_resp(201, "")

    # conn
    # |> put_resp_content_type("text/xml")
    # |> render("index.xml", content: some_xml_content)

    # conn
    # |> put_root_layout(false)
    # |> render("index.html")

    # conn
    # |> put_root_layout("admin.html")
    # |> render("index.html")
  end

  def redirect_test(conn, _params) do
    redirect(conn, to: Routes.live_dashboard_path(conn, :home))
    # redirect(conn, external: "https://elixir-lang.org/")
  end
end
