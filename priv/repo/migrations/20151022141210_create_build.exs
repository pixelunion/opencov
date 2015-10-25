defmodule Opencov.Repo.Migrations.CreateBuild do
  use Ecto.Migration

  def change do
    create table(:builds) do
      add :number, :integer, null: false
      add :project_id, :integer, null: false
      add :coverage, :float, null: false
      add :previous_coverage, :float
      add :previous_build_id, :integer

      add :service_name, :string
      add :service_job_id, :string
      add :service_job_pull_request, :string

      add :commit_sha, :string
      add :author_name, :string
      add :author_email, :string
      add :commit_message, :text
      add :branch, :string

      add :build_started_at, :datetime, null: false
      add :completed, :boolean

      timestamps
    end

    create index(:builds, [:project_id])
    create unique_index(:builds, [:project_id, :number])
    create index(:builds, [:previous_build_id])
  end
end