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
## Review
### GOOD
- GitHub の Issue 機能を利用して、一部チケット管理を行っていました。
- Firebase Authentication や Cloud Firestore を導入して、アカウント登録、ログイン・ログアウト、検索履歴などの機能を新たに開発していました。
- 主要機能・使用技術・ファイル構造を README に記載していただいていたことで、レビューがしやすく助かりました。
- freezed を利用しており immutable を意識して開発できていました。
- フォームのさまざまな入力値のバリデーションを考慮していました。

### MORE

- 開発を始めるまでの必要な手順が README などに記載されていませんでした。将来の自分・レビュアー・他の開発者のことを考え、使用する Flutter SDK バージョンや Firebae プロジェクトの構築方法などを記載しておくと、より安全に素早く開発を進めることができるようになります。
  - Firebase の環境をある程度自動的に構築できるように flutterfire などを使ったスクリプトをどこかに記載しておくなどしてもいいかもしれません。
    - https://firebase.google.com/docs/flutter/setup?platform=android
  - Firebase のアプリの設定情報は公開されることを前提にしているため、 Git 管理に含めて、適切なセキュリティ設定を行うなどすると、 Firebase プロジェクトを個別に作成したり、特定のメンバーに権限を付与したりするなどの対応が必要なくなるためいいかもしれません。
    - https://firebase.google.com/docs/projects/api-keys?hl=ja
- 開発時のみに使用する freezed などのパッケージは dependencies でなく dev_dependencies に記載するとより適切です。
  - https://pub.dev/packages/freezed#install
  - https://dart.dev/tools/pub/dependencies#dev-dependencies
- Container の padding プロパティを利用すると、よりネストを浅くできて可読性が向上しそうです。
  - 複数の設定値が不要な場合は、 Container ではなく DecoratedBox や ColoredBox などを活用することで const を付与でき、パフォーマンスが向上することがあります。
    - https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html
    - https://api.flutter.dev/flutter/widgets/ColoredBox-class.html
- キーをハードコーディングしている箇所がありました。 freezed や json_serializable を適切に利用することで、より保守性・安全性を高められるためおすすめです。
- 端末サイズによって、 ModalBottomSheet でレイアウトエラーが発生するような作りになっていました。スクロール可能にしたり、画面サイズによって構成を変更したりするなど、普段から気をつけておくことをおすすめします。
  - FittedBox を利用してある程度を自動でサイズを調整できるようにするのもいいかもしれません。
    - https://api.flutter.dev/flutter/widgets/FittedBox-class.html
  - Wideget tests でいくつかの端末サイズで自動チェックできるようにしておくとより安全に開発進められるようになりそうです。
    - https://docs.flutter.dev/cookbook/testing/widget/introduction
- いくつか不要な import が残っていたり、リリースビルドで print() が実行されるようになっていたりして警告が表示されていました。 `dart analyze` コマンドなどで警告を一覧で確認して対応することで、より保守性を向上させることができます。
  - https://dart.dev/tools/dart-analyze
  - https://dart.dev/tools/linter-rules/avoid_print
