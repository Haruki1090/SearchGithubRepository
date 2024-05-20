import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:search_github_repository/service/auth.dart';

class UserInfoWidget extends ConsumerWidget {
  const UserInfoWidget({super.key});

  Future<String?> _getUsername(User user) async {
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (userDoc.exists) {
      return userDoc.data()?['username'] as String?;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: authState.when(
        data: (user) {
          if (user != null) {
            return FutureBuilder<String?>(
              future: _getUsername(user),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('エラー: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text(
                    'こんにちは、${snapshot.data}さん',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return const Text('ユーザー名が取得できませんでした');
                }
              },
            );
          }
          return null;
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('エラー: $error'),
      ),
    );
  }
}
