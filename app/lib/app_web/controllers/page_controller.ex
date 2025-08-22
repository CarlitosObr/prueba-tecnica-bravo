defmodule AppWeb.PageController do
  use AppWeb, :controller

  def home(conn, _params) do
    api_key = System.get_env("API_KEY_WEATHER")
    render(conn, :home, api_key_env: api_key)
  end

  def healthy(conn, _params) do
    is_alive = true
    json(conn, %{is_alive: is_alive})
  end

  def test(conn, _params) do
    render(conn, :test)
  end

end
