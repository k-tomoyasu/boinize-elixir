# Boinize
係り受け解析器CaboChaを利用して日本語の文章を母音に変換する

## Installation
1. Install [CaboCha](https://taku910.github.io/cabocha/)
2. Add your dependencies in `mix.exs` 

```elixir
def deps do
  [
    {:boinize, "~> 0.1.0"}
  ]
end
```

## Usage
### parse/1
```elixir
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
```

### parse_clause/1
```elixir
iex> Boinize.parse_clause("明日は晴れ")
[
  %{
    "boin" => "イョウア",
    "origin" => [
      %{
        "base" => "今日",
        "conjugation" => "",
        "conjugation_form" => "",
        "id" => 0,
        "pos" => "名詞",
        "pos1" => "副詞可能",
        "pos2" => "",
        "pos3" => "",
        "pronunciation" => "キョー",
        "surface" => "今日",
        "yomi" => "キョウ"
      },
      %{
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
    ]
  },
  %{
    "boin" => "アエ",
    "origin" => [
      %{
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
    ]
  }
]
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/boinize](https://hexdocs.pm/boinize).

