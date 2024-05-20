// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github_repository/provider/search_history_provider.dart';
import 'package:search_github_repository/screens/result_page.dart';
import 'package:search_github_repository/utils/search_api.dart';

class SearchHistoryList extends ConsumerWidget {
  final TextEditingController queryWordController;

  const SearchHistoryList({super.key, required this.queryWordController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchHistoryAsyncValue = ref.watch(searchHistoryProvider);

    return searchHistoryAsyncValue.when(
      data: (searchHistoryList) {
        return ListView.builder(
          itemCount: searchHistoryList.length,
          itemBuilder: (context, index) {
            final searchHistory = searchHistoryList[index];
            return Card(
              child: ListTile(
                title: Text(searchHistory.query),
                onTap: () async{
                  queryWordController.text = searchHistory.query;
                  final List result =
                  await searchApi(searchHistory.query, context);
                  if (result.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          result: result,
                          query: searchHistory.query,
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
