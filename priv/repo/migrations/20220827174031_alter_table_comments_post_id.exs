defmodule CommunityWrites.Repo.Migrations.AlterTableCommentsPostId do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      remove(:post_id)
      add(:post_id, references(:posts, on_delete: :delete_all))
    end
  end
end
