defmodule CommunityWrites.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add(:title, :string)
      add(:description, :string)
      add(:post_id, references(:posts, on_delete: :delete_all))

      timestamps()
    end
  end
end
