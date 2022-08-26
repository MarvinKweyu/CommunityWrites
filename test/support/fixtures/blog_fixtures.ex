defmodule ResonatingThoughts.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ResonatingThoughts.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        published: true,
        title: "some title"
      })
      |> ResonatingThoughts.Blog.create_post()

    post
  end
end
