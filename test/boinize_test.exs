defmodule BoinizeTest do
  use ExUnit.Case
  doctest Boinize

  test "parse/1 split text by morpheme" do
    assert Enum.map(Boinize.parse("今日は良い天気です。"), fn x -> x["boin"] end) == ["イョウ", "ア", "オイ", "エンイ", "エウ", "。"]
  end

  test "parse_clause/1 split text by clause" do
    assert Enum.map(Boinize.parse_clause("今日は良い天気です。"), fn x -> x["boin"] end) == ["イョウア", "オイ", "エンイエウ。"]
  end

end
