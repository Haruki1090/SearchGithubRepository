// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// アカウント新規作成処理を行う関数
Future<void> createUserWithEmailAndPassword({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    if (e.code == 'weak-password') {
      errorMessage = '提供されたパスワードは弱すぎます。';
    } else if (e.code == 'email-already-in-use') {
      errorMessage = 'そのメールアドレスには既にアカウントが存在します。';
    } else {
      errorMessage = '認証中にエラーが発生しました: ${e.message}';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('エラーが発生しました: $e')),
    );
  }
}