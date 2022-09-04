defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {HelloWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HelloWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/admin", HelloWeb.Admin, as: :admin do
  #   pipe_through :browser

  #   resources "/reviews", ReviewController
  # end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/redirect", PageController, :redirect_test
    get "/ping", HelloController, :ping
    get "/posts", HelloController, :post
    get "/fallback/:data", FallbackController, :index
    # Run `mix phx.routes` to list all routes.
    # resources -> creates crud routes for a given path
    # resources "/users", UserController
    # resources "/posts", PostController, only: [:index, :show]
    # resources "/comments", CommentController, except: [:delete]

    # Nested Routing
    # resources "/users", UserController do
    #   resources "/posts", PostController
    # end
  end

  scope "/api/v1", HelloWeb do
    pipe_through :api

    post "/posts", HelloController, :create
  end
  #   get "/ping", ApiController, :index
  #   resources "/reviews", ReviewController
  # end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end

  # The `Phoenix.Router.forward/4` macro can be used to send all requests that start with
  # a particular path to a particular plug.
  # Let's say we have a part of our system that is responsible
  # (it could even be a separate application or library) for running jobs in
  # the background, it could have its own web interface for checking
  # the status of the jobs. We can forward to this admin interface using:
  # This means that all routes starting with /jobs will be sent to the HelloWeb.BackgroundJob.Plug module
  # forward "/jobs", BackgroundJob.Plug

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: HelloWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
