defmodule WeatherWeb.PageController do
  use WeatherWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
