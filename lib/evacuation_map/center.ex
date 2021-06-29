defmodule Center do
  def read_csv(filename) do
    {status,contents}=File.read(filename)
    case status do
      :ok -> contents
      :error -> "ファイル名が不正です。"
    end
  end

  def make_list(contents) do
    keys=
    String.split(contents,"\r\n")
    |> Enum.at(0)
    |> String.replace_prefix("\uFEFF", "")
    |> String.split(",")
    values=
    String.split(contents,"\r\n")
    |> List.delete_at(0)
    |> Enum.map(&String.split(&1,","))
    {keys,values}
  end

  def make_map(keys,values) do
    maps = Enum.map(values,&[{Enum.at(keys,0),Enum.at(&1,0)},{Enum.at(keys,1),Enum.at(&1,1)},{Enum.at(keys,2),Enum.at(&1,2)},{Enum.at(keys,3),Enum.at(&1,3)},{Enum.at(keys,4),Enum.at(&1,4)},{Enum.at(keys,5),Enum.at(&1,5)},{Enum.at(keys,6),Enum.at(&1,6)}])
    Enum.map(maps,&Map.new(&1))
  end

  def main do
    {keys,values}
    =read_csv("130001_evacuation_center.csv")
    |> make_list()
    make_map(keys,values)
  end
end
