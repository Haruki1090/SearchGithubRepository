import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:search_github_repository/utils/time_stamp_converter.dart';

part 'search_history_model.freezed.dart';
part 'search_history_model.g.dart';

@freezed
class SearchHistory with _$SearchHistory {
  const factory SearchHistory({
    required String query,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
    @Default(false) bool favorite,
  }) = _SearchHistory;

  factory SearchHistory.fromJson(Map<String, dynamic> json) => _$SearchHistoryFromJson(json);
}
