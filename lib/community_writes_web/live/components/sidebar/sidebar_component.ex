defmodule CommunityWrites.Components.Sidebar.SidebarComponent do
  use CommunityWritesWeb, :live_component

  @impl true
  def mount(socket) do
    most_commented = []

    {:ok,
     socket
     |> assign(:search_result, nil)
     |> assign(:search, nil)
     |> assign(:most_commented, most_commented)}
  end

  @impl true
  def handle_event("search", %{"search" => %{"query" => term}}, socket) do
    term = String.trim(term)
    search_result = CommunityWrites.Blog.search_article_by_title_or_content(term)
    {:noreply, socket |> assign(:search_result, search_result)}
  end
end
