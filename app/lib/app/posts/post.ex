defmodule App.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :name, :string
    field :lat, :string
    field :lon, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :lat, :lon])
    |> validate_required([:name, :lat, :lon])
  end
end
