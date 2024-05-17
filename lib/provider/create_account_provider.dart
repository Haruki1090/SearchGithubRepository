import 'package:flutter_riverpod/flutter_riverpod.dart';

// 「アカウント新規作成画面」におけるEmail入力欄の状態を管理するProvider
final inputCreateUserEmailProvider = StateProvider<String>((ref) => '');

// 「アカウント新規作成画面」におけるPassword入力欄の状態を管理するProvider
final inputCreateUserPasswordProvider = StateProvider<String>((ref) => '');

// 「ログイン」とは別に用意しようかな。