defmodule CommunityWritesWeb.PostLive.Show do
  use CommunityWritesWeb, :post_live_view

  alias CommunityWrites.Blog
  alias CommunityWrites.Blog.Comment


  @impl true
  def mount(_params, _session, socket) do
    changeset = Comment.changeset(%Comment{}, %{})
    {:ok, socket |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:comments, Blog.get_comments_of_post(id))
     |> assign(:post, Blog.get_post!(id))}
  end

    @impl true
  def handle_event("validate", %{"post" => post_params}, socket) do
    changeset =
      socket.assigns.post
      |> Blog.change_comment(post_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"
end
