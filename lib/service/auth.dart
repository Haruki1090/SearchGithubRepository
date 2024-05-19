// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:search_github_repository/screens/home_screen.dart';
import 'package:search_github_repository/utils/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// アカウント新規作成処理を行う関数
Future<void> createUserWithEmailAndPassword({
  required BuildContext context,
  required String email,
  required String password,
  required String username, // ユーザー名など追加の情報
}) async {
  showLoadingIndicator(context); // ローディングインジケーターを表示
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': email,
        'username': username,
        'createdAt': Timestamp.now(),
        // 必要に応じて他の情報も追加
      });

      hideLoadingIndicator(context); // ローディングインジケーターを非表示
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('アカウントを作成に成功しました。'), backgroundColor: Colors.green),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(title: 'Search GitHub Repository'),
        ),
            (route) => false,
      );
    }
  } on FirebaseAuthException catch (e) {
    hideLoadingIndicator(context); // ローディングインジケーターを非表示
    String errorMessage;
    if (e.code == 'weak-password') {
      errorMessage = '提供されたパスワードは弱すぎます。';
    } else if (e.code == 'email-already-in-use') {
      errorMessage = 'そのメールアドレスには既にアカウントが存在します。';
    } else {
      errorMessage = '認証中にエラーが発生しました: ${e.message}';
      print('FirebaseAuthException: $e');
    }
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
    );
  } catch (e) {
    hideLoadingIndicator(context); // ローディングインジケーターを非表示
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('エラーが発生しました: $e'), backgroundColor: Colors.red),
    );
    print('Error: $e');
  }
}


// ログインしているかどうかを確認する関数
bool isUserLoggedIn() {
  User? user = FirebaseAuth.instance.currentUser;
  return user != null;
}