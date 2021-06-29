defmodule EvacuationMapWeb.PageController do
  use EvacuationMapWeb, :controller

  alias EvacuationMap.Evacurations
  alias EvacuationMap.Evacurations.Center

  def index(conn, _params) do
    centers = Evacurations.list_centers()
    render(conn, "index.html", centers: centers)
  end

  def new(conn, _params) do
    changeset = Evacurations.change_center(%Center{})
    render(conn, "new.html", changeset: changeset)
  end

  # def search(conn, %{"id" => id}) do
  #   center = Evacurations.list_centers(id)
  #   render(conn, "search.html", center: center)
  # end

end
