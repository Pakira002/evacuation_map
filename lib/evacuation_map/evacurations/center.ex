defmodule EvacuationMap.Evacurations.Center do
  use Ecto.Schema
  # import Ecto.Changeset

  schema "centers" do
    field :住所, :string
    field :地方公共団体コード, :integer
    field :指定区市町村名, :string
    field :経度, :float
    field :緯度, :float
    field :避難所_名称, :string
    field :都道府県, :string

    timestamps()
  end

  # @doc false
  # def changeset(center, attrs) do
  #   center
  #   |> cast(attrs, [:避難所_名称, :地方公共団体コード, :都道府県, :指定区市町村名, :住所, :緯度, :経度])
  #   |> validate_required([:避難所_名称, :地方公共団体コード, :都道府県, :指定区市町村名, :住所, :緯度, :経度])
  # end

  def changeset(center, csv_data \\ %{}) do
    center
    |> Ecto.Changeset.cast(csv_data, [:住所, :地方公共団体コード, :指定区市町村名, :経度, :緯度, :避難所_名称, :都道府県])
  end

  def main do
    map = Center.main
    center = %EvacuationMap.Evacurations.Center{}
    Enum.each(map, fn data ->
      changeset(center, data)
      |> EvacuationMap.Repo.insert()
      end)
  end

end
