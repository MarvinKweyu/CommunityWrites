defmodule CommunityWrites.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    belongs_to(:user, CommunityWrites.Accounts.User)
    belongs_to(:post, CommunityWrites.Blog.Post)
    field(:content, :string)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user_id, :post_id, :content])
    |> validate_required([:user_id, :post_id, :content])
    |> validate_length(:content, min: 5)
  end
end
