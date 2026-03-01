# MultiPing

PowerShell で複数ターゲットに連続 Ping を送信し、結果をグリッドビューで表示するスクリプトです。

## 機能

- 複数の IP アドレスへの連続 Ping 送信
- 結果（ok/ng）、日時、対象アドレス、応答時間を記録
- Out-GridView による一覧表示

## 使い方

### 1. ターゲットの設定

`MultiPing.ps1` 内の `$targets` にPing 対象の IP アドレスを記述します。

```powershell
$targets = @"
192.168.1.1
192.168.1.2
10.0.0.1
"@ -split "\r\n" | Where-Object { $_ -ne "" }
```

### 2. パラメータの調整

必要に応じて以下の変数を変更してください。

| 変数 | 説明 | デフォルト値 |
|------|------|-------------|
| `$interval` | Ping 送信間隔（ミリ秒） | 500 |
| `$repeat` | 繰り返し回数 | 100 |

### 3. 実行

```powershell
.\MultiPing.ps1
```

## 動作環境

- Windows PowerShell 5.1 以降
- `Out-GridView` を使用するため Windows 環境が必要です

## 参考元

- [PowerShellで複数ターゲットに連続Ping - Qiita](https://qiita.com/akira6592/items/236939ad62bd1f98371e)
