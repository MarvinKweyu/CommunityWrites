defmodule ResonatingThoughts.Repo.Migrations.CreateCommentsTable do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add(:user_id, references(:users, on_delete: :delete_all))
      add(:post_id, references(:users, on_delete: :delete_all))
      add(:content, :string)

      timestamps()
    end

    create(index(:comments, [:post_id, :user_id]))
  end
end
