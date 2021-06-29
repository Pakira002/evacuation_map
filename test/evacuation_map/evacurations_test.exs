defmodule EvacuationMap.EvacurationsTest do
  use EvacuationMap.DataCase

  alias EvacuationMap.Evacurations

  describe "centers" do
    alias EvacuationMap.Evacurations.Center

    @valid_attrs %{住所: "some 住所", 地方公共団体コード: 42, 指定区市町村名: "some 指定区市町村名", 経度: 120.5, 緯度: 120.5, 避難所_名称: "some 避難所_名称", 都道府県: "some 都道府県"}
    @update_attrs %{住所: "some updated 住所", 地方公共団体コード: 43, 指定区市町村名: "some updated 指定区市町村名", 経度: 456.7, 緯度: 456.7, 避難所_名称: "some updated 避難所_名称", 都道府県: "some updated 都道府県"}
    @invalid_attrs %{住所: nil, 地方公共団体コード: nil, 指定区市町村名: nil, 経度: nil, 緯度: nil, 避難所_名称: nil, 都道府県: nil}

    def center_fixture(attrs \\ %{}) do
      {:ok, center} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Evacurations.create_center()

      center
    end

    test "list_centers/0 returns all centers" do
      center = center_fixture()
      assert Evacurations.list_centers() == [center]
    end

    test "get_center!/1 returns the center with given id" do
      center = center_fixture()
      assert Evacurations.get_center!(center.id) == center
    end

    test "create_center/1 with valid data creates a center" do
      assert {:ok, %Center{} = center} = Evacurations.create_center(@valid_attrs)
      assert center.住所 == "some 住所"
      assert center.地方公共団体コード == 42
      assert center.指定区市町村名 == "some 指定区市町村名"
      assert center.経度 == 120.5
      assert center.緯度 == 120.5
      assert center.避難所_名称 == "some 避難所_名称"
      assert center.都道府県 == "some 都道府県"
    end

    test "create_center/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Evacurations.create_center(@invalid_attrs)
    end

    test "update_center/2 with valid data updates the center" do
      center = center_fixture()
      assert {:ok, %Center{} = center} = Evacurations.update_center(center, @update_attrs)
      assert center.住所 == "some updated 住所"
      assert center.地方公共団体コード == 43
      assert center.指定区市町村名 == "some updated 指定区市町村名"
      assert center.経度 == 456.7
      assert center.緯度 == 456.7
      assert center.避難所_名称 == "some updated 避難所_名称"
      assert center.都道府県 == "some updated 都道府県"
    end

    test "update_center/2 with invalid data returns error changeset" do
      center = center_fixture()
      assert {:error, %Ecto.Changeset{}} = Evacurations.update_center(center, @invalid_attrs)
      assert center == Evacurations.get_center!(center.id)
    end

    test "delete_center/1 deletes the center" do
      center = center_fixture()
      assert {:ok, %Center{}} = Evacurations.delete_center(center)
      assert_raise Ecto.NoResultsError, fn -> Evacurations.get_center!(center.id) end
    end

    test "change_center/1 returns a center changeset" do
      center = center_fixture()
      assert %Ecto.Changeset{} = Evacurations.change_center(center)
    end
  end
end
