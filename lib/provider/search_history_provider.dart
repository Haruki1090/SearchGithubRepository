import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github_repository/models/search_history_model.dart';
import 'package:search_github_repository/service/auth.dart';

final searchHistoryProvider = StreamProvider<List<SearchHistory>>((ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    return Stream.value([]);  // ユーザーがログインしていない場合は空のリストを返す
  }
  return FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('search_history')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => SearchHistory.fromJson(doc.data())).toList());
});
