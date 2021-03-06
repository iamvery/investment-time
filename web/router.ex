defmodule InvestmentTime.Router do
  use InvestmentTime.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InvestmentTime do
    pipe_through :browser # Use the default browser stack

    get "/", UserController, :index
    resources "/users", UserController, only: [:create] do
      get "/invest/yay", InvestmentController, :yay, as: :yay
      get "/invest/nay", InvestmentController, :nay, as: :nay
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", InvestmentTime do
  #   pipe_through :api
  # end
end
