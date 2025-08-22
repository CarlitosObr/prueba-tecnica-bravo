defmodule App.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string
      add :lat, :string
      add :lon, :string

      timestamps(type: :utc_datetime)
    end
  end
end
