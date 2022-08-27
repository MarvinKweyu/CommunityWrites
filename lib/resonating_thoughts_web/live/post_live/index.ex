defmodule ResonatingThoughtsWeb.PostLive.Index do
  use ResonatingThoughtsWeb, :post_live_view

  alias ResonatingThoughts.Blog
  alias ResonatingThoughts.Blog.Post

  @impl true
  def mount(_params, session, socket) do
    _session_id = Map.get(session, "phauxth_session_id")
    if connected?(socket), do: Blog.subscribe()
    {:ok, assign(socket, :posts, list_posts()), temporary_assigns: [posts: []]}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Blog.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    tags = Blog.list_tags()

    socket
    |> assign(:page_title, "Home Page")
    |> assign(:post, nil)
    |> assign(:tags, tags)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts())}
  end

  @impl true
  def handle_info({:article_created, post}, socket) do
    IO.inspect(label: "updating date5")
    {:noreply, update(socket, :posts, fn posts -> [post | posts] end)}
  end

  defp list_posts do
    Blog.list_published_posts()
  end
end
