defmodule EvacuationMapWeb.CenterControllerTest do
  use EvacuationMapWeb.ConnCase

  alias EvacuationMap.Evacurations

  @create_attrs %{住所: "some 住所", 地方公共団体コード: 42, 指定区市町村名: "some 指定区市町村名", 経度: 120.5, 緯度: 120.5, 避難所_名称: "some 避難所_名称", 都道府県: "some 都道府県"}
  @update_attrs %{住所: "some updated 住所", 地方公共団体コード: 43, 指定区市町村名: "some updated 指定区市町村名", 経度: 456.7, 緯度: 456.7, 避難所_名称: "some updated 避難所_名称", 都道府県: "some updated 都道府県"}
  @invalid_attrs %{住所: nil, 地方公共団体コード: nil, 指定区市町村名: nil, 経度: nil, 緯度: nil, 避難所_名称: nil, 都道府県: nil}

  def fixture(:center) do
    {:ok, center} = Evacurations.create_center(@create_attrs)
    center
  end

  describe "index" do
    test "lists all centers", %{conn: conn} do
      conn = get(conn, Routes.center_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Centers"
    end
  end

  describe "new center" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.center_path(conn, :new))
      assert html_response(conn, 200) =~ "New Center"
    end
  end

  describe "create center" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.center_path(conn, :create), center: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.center_path(conn, :show, id)

      conn = get(conn, Routes.center_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Center"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.center_path(conn, :create), center: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Center"
    end
  end

  describe "edit center" do
    setup [:create_center]

    test "renders form for editing chosen center", %{conn: conn, center: center} do
      conn = get(conn, Routes.center_path(conn, :edit, center))
      assert html_response(conn, 200) =~ "Edit Center"
    end
  end

  describe "update center" do
    setup [:create_center]

    test "redirects when data is valid", %{conn: conn, center: center} do
      conn = put(conn, Routes.center_path(conn, :update, center), center: @update_attrs)
      assert redirected_to(conn) == Routes.center_path(conn, :show, center)

      conn = get(conn, Routes.center_path(conn, :show, center))
      assert html_response(conn, 200) =~ "some updated 住所"
    end

    test "renders errors when data is invalid", %{conn: conn, center: center} do
      conn = put(conn, Routes.center_path(conn, :update, center), center: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Center"
    end
  end

  describe "delete center" do
    setup [:create_center]

    test "deletes chosen center", %{conn: conn, center: center} do
      conn = delete(conn, Routes.center_path(conn, :delete, center))
      assert redirected_to(conn) == Routes.center_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.center_path(conn, :show, center))
      end
    end
  end

  defp create_center(_) do
    center = fixture(:center)
    %{center: center}
  end
end
