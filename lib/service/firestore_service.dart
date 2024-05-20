import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:search_github_repository/models/search_history_model.dart';

// 検索履歴を作成する関数
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

// 検索履歴を取得する関数
Stream<List<SearchHistory>> getSearchHistory() {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return Stream.value([]);
  }

  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('search_history')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => SearchHistory.fromJson(doc.data())).toList());
}