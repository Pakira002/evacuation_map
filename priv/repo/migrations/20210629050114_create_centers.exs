defmodule EvacuationMap.Repo.Migrations.CreateCenters do
  use Ecto.Migration

  def change do
    create table(:centers) do
      add :避難所_名称, :string
      add :地方公共団体コード, :integer
      add :都道府県, :string
      add :指定区市町村名, :string
      add :住所, :string
      add :緯度, :float
      add :経度, :float

      timestamps()
    end

  end
end
