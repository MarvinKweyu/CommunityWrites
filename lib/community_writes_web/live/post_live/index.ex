defmodule CommunityWritesWeb.PostLive.Index do
  use CommunityWritesWeb, :post_live_view

  alias CommunityWrites.Blog
  alias CommunityWrites.Blog.Post

  @impl true
  def mount(_params, session, socket) do
    _session_id = Map.get(session, "phauxth_session_id")
    if connected?(socket), do: Blog.subscribe()

    # {:ok, assign(socket, assigns), temporary_assigns: [posts: []]}
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, params) do
    %{
      entries: entries,
      page_number: page_number,
      page_size: page_size,
      total_entries: total_entries,
      total_pages: total_pages
    } = list_posts(params)

    socket
    |> assign(:title, "Articles")
    |> assign(:posts, entries)
    |> assign(:page_number, page_number || 0)
    |> assign(:page_size, page_size || 0)
    |> assign(:total_entries, total_entries || 0)
    |> assign(:total_pages, total_pages || 0)
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

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts())}
  end

  def handle_event("nav", %{"page" => _page}, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_info({:article_created, post}, socket) do
    {:noreply, update(socket, :posts, fn posts -> [post | posts] end)}
  end

  defp list_posts(params \\ []) do
    Blog.paginate_published_posts(params)
  end
end
