defmodule EvacuationMapWeb.CenterController do
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

  def create(conn, %{"center" => center_params}) do
    case Evacurations.create_center(center_params) do
      {:ok, center} ->
        conn
        |> put_flash(:info, "Center created successfully.")
        |> redirect(to: Routes.center_path(conn, :show, center))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    center = Evacurations.get_center!(id)
    render(conn, "show.html", center: center)
  end

  def edit(conn, %{"id" => id}) do
    center = Evacurations.get_center!(id)
    changeset = Evacurations.change_center(center)
    render(conn, "edit.html", center: center, changeset: changeset)
  end

  def update(conn, %{"id" => id, "center" => center_params}) do
    center = Evacurations.get_center!(id)

    case Evacurations.update_center(center, center_params) do
      {:ok, center} ->
        conn
        |> put_flash(:info, "Center updated successfully.")
        |> redirect(to: Routes.center_path(conn, :show, center))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", center: center, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    center = Evacurations.get_center!(id)
    {:ok, _center} = Evacurations.delete_center(center)

    conn
    |> put_flash(:info, "Center deleted successfully.")
    |> redirect(to: Routes.center_path(conn, :index))
  end
end
