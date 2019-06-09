defmodule Boinize do
  @moduledoc """
  Documentation for Boinize.
  """

  @doc """
  ## Examples
  iex> Boinize.parse("明日は晴れ")
  [
    %{
      "boin" => "アイア",
      "origin" => %{
        "base" => "明日",
        "conjugation" => "",
        "conjugation_form" => "",
        "id" => 0,
        "pos" => "名詞",
        "pos1" => "副詞可能",
        "pos2" => "",
        "pos3" => "",
        "pronunciation" => "アシタ",
        "surface" => "明日",
        "yomi" => "アシタ"
      }
    },
    %{
      "boin" => "ア",
      "origin" => %{
        "base" => "は",
        "conjugation" => "",
        "conjugation_form" => "",
        "id" => 1,
        "pos" => "助詞",
        "pos1" => "係助詞",
        "pos2" => "",
        "pos3" => "",
        "pronunciation" => "ワ",
        "surface" => "は",
        "yomi" => "ハ"
      }
    },
    %{
      "boin" => "アエ",
      "origin" => %{
        "base" => "晴れ",
        "conjugation" => "",
        "conjugation_form" => "",
        "id" => 2,
        "pos" => "名詞",
        "pos1" => "一般",
        "pos2" => "",
        "pos3" => "",
        "pronunciation" => "ハレ",
        "surface" => "晴れ",
        "yomi" => "ハレ"
      }
    }
  ]
  """

  def parse text do
    CaboCha.parse(text)
    |> List.first
    |> Enum.map(fn elm ->
        elm["morphs"]
        |> Enum.map(fn morph ->
          morph["yomi"]
          |> to_boin
          |> map_origin(morph)
          end)
        end)
    |> List.flatten
  end

  def parse_clause text do
    CaboCha.parse(text)
    |> List.first
    |> Enum.map(fn elm ->
      elm["morphs"]
      |> Enum.map(fn morph ->
        morph["yomi"]
        |> to_boin
        end)
      |> Enum.join("")
      |> map_origin(elm["morphs"])
      end)
  end

  defp to_boin str do 
    String.codepoints(str)
    |> Enum.map(fn x -> boin(x) end)
    |> Enum.join("")
  end

  defp boin(x) do
    cond do
      :binary.match("アカガサザタダナハバパマヤラワ", x) != :nomatch -> "ア"
      :binary.match("イキギシジチヂニヒビピミリ", x) != :nomatch -> "イ"
      :binary.match("ウクグスズツヅヌフブプムユル", x) != :nomatch -> "ウ"
      :binary.match("エケゲセゼテデネへべぺメレ", x) != :nomatch -> "エ"
      :binary.match("オコゴソゾトドノホボポモヨロヲ", x) != :nomatch -> "オ"
      true -> x
    end
  end

  defp map_origin(boin, origin), do: %{"boin" => boin, "origin" => origin}
end
