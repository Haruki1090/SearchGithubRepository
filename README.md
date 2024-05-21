# search_github_repository
- GitHubにあるリポジトリなどを検索し探せるアプリ

## 主要機能
- GitHub内のリポジトリの検索
- 検索履歴の保持

## 使用技術
| 項目 | 名称 |
|-|-|
| 言語 | Flutter (Dart) |
| 状態管理 | Riverpod |
| データベース | Firebase Firestore |
| アカウント管理 | Firebase Authentication |

## ファイル構造

```
├── lib
│   ├── components
│   │   ├── log_out.dart
│   │   ├── search_history_list.dart
│   │   ├── userInfo_widget.dart
│   │   └── welcome_dialog.dart
│   ├── firebase_options.dart
│   ├── main.dart
│   ├── models
│   │   ├── search_history_model.dart
│   │   ├── search_history_model.freezed.dart
│   │   └── search_history_model.g.dart
│   ├── provider
│   │   └── search_history_provider.dart
│   ├── screens
│   │   ├── create_account_screen.dart
│   │   ├── detail_page.dart
│   │   ├── home_screen.dart
│   │   ├── login_screen.dart
│   │   └── result_page.dart
│   ├── service
│   │   ├── auth.dart
│   │   └── firestore_service.dart
│   └── utils
│       ├── loading_indicator.dart
│       ├── search_api.dart
│       └── time_stamp_converter.dart
├── pubspec.lock
├── pubspec.yaml
```
