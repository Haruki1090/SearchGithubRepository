import 'package:flutter/material.dart';
import 'package:search_github_repository/service/auth.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await signOut(context: context);
          },
          child: const Text('ログアウト'),
        ),
      ),
    );
  }
}
