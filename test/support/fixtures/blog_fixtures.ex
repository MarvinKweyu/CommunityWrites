defmodule CommunityWrites.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CommunityWrites.Blog` context.
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
      |> CommunityWrites.Blog.create_post()

    post
  end

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> CommunityWrites.Blog.create_tag()

    tag
  end
end
