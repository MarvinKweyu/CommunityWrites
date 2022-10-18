defmodule CommunityWritesWeb.PageController do
  use CommunityWritesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
