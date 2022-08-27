defmodule ResonatingThoughts.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :description, :string
    field :title, :string
    belongs_to(:post, ResonatingThoughts.Blog.Post)

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:title, :description, :post_id])
    |> validate_required([:title, :post_id])
  end
end
