defmodule AppWeb.PostControllerTest do
  use AppWeb.ConnCase

  import App.PostsFixtures
  alias App.Posts.Post

  @create_attrs %{
    name: "some name",
    lat: "some lat",
    lon: "some lon"
  }
  @update_attrs %{
    name: "some updated name",
    lat: "some updated lat",
    lon: "some updated lon"
  }
  @invalid_attrs %{name: nil, lat: nil, lon: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cities", %{conn: conn} do
      conn = get(conn, ~p"/api/cities")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create post" do
    test "renders post when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/cities", post: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/cities/#{id}")

      assert %{
               "id" => ^id,
               "lat" => "some lat",
               "lon" => "some lon",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/cities", post: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update post" do
    setup [:create_post]

    test "renders post when data is valid", %{conn: conn, post: %Post{id: id} = post} do
      conn = put(conn, ~p"/api/cities/#{post}", post: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/cities/#{id}")

      assert %{
               "id" => ^id,
               "lat" => "some updated lat",
               "lon" => "some updated lon",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, post: post} do
      conn = put(conn, ~p"/api/cities/#{post}", post: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete(conn, ~p"/api/cities/#{post}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/cities/#{post}")
      end
    end
  end

  defp create_post(_) do
    post = post_fixture()

    %{post: post}
  end
end
