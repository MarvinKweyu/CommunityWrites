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
    comments= Blog.get_comments_of_post(id) |> IO.inspect(label: "comments")
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post_id, id)
     |> assign(:comments, comments)
     |> assign(:post, Blog.get_post!(id))}
  end

  @impl true
  def handle_event("validate", %{"comment" => comment_params}, socket) do
    changeset =
      socket.assigns.post
      |> Blog.change_comment(comment_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  @impl true
  def handle_event("newcomment", %{"comment" => comment_params}, socket) do
    # check if the user is on the socket. Add this at the endpoint
    # is user is abscent, redirect to register or show an alert to authenticate and come back to this page
    # add post id and user id
    comment_params =
      Map.merge(comment_params, %{"user_id" => 1, "post_id" => socket.assigns.post_id})

    case Blog.create_comment(comment_params) do
      {:ok, comment} ->
        IO.inspect(comment, label: "new comment added")

        {:noreply,
         push_patch(socket, to: Routes.post_show_path(socket, :show, socket.assigns.post_id))}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset, label: "unable to comment at this time")
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"
end
