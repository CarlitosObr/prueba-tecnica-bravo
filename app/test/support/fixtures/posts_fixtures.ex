defmodule App.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        lat: "some lat",
        lon: "some lon",
        name: "some name"
      })
      |> App.Posts.create_post()

    post
  end
end
