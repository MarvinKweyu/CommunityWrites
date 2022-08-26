defmodule ResonatingThoughtsWeb.PageController do
  use ResonatingThoughtsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
