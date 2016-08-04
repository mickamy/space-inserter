# space-inserter

## WTF is this?

テキストファイル中の、全角文字の直後の英単語の前後に半角スペースを挿入する

（正規表現だと`[a-z|A-Z][^\x01-\x7E]|[^\x01-\x7E][a-z|A-Z]`）


Before

```
日本語の文章の中にhankakuのe-jiを入力する際、
その前後にhankakuスペースを入れるとkanari読みやすくなります
```

After

```
日本語の文章の中に hankaku の e-ji を入力する際、
その前後に hankaku スペースを入れると kanari 読みやすくなります
```

## Usage

1. `input.txt`に変換したいテキストを打ち込む
2. `ruby space_inserter`
3. スペースを挿入するたびに Yes / No を選択したければ y, 自動モードは n
4. `output.txt`に変換結果が出力

