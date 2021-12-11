defmodule LearnElixirWeb.PageController do
  use LearnElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
