import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:search_github_repository/models/search_history_model.dart';

Future<void> createSearchHistory(String query) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    throw Exception('ユーザーがログインしていません');
  }

  final searchHistory = SearchHistory(
    query: query,
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  );

  final document = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('search_history')
      .doc();

  await document.set(searchHistory.toJson());
}
