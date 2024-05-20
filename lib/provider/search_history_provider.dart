import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github_repository/models/search_history_model.dart';
import 'package:search_github_repository/service/firestore_service.dart';

final searchHistoryProvider = StreamProvider<List<SearchHistory>>((ref) {
  return getSearchHistory();
});
