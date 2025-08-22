defmodule AppWeb.PostJSON do
  alias App.Posts.Post

  @doc """
  Renders a list of cities.
  """
  def index(%{cities: cities}) do
    %{data: for(post <- cities, do: data(post))}
  end

  @doc """
  Renders a single post.
  """
  def show(%{post: post}) do
    %{data: data(post)}
  end

  defp data(%Post{} = post) do
    %{
      id: post.id,
      name: post.name,
      lat: post.lat,
      lon: post.lon
    }
  end
end
