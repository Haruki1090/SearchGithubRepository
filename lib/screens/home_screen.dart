// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github_repository/components/my_page.dart';
import 'package:search_github_repository/components/search_history_list.dart';
import 'package:search_github_repository/components/welcome_dialog.dart';
import 'package:search_github_repository/provider/search_history_provider.dart';
import 'package:search_github_repository/screens/result_page.dart';
import 'package:search_github_repository/service/auth.dart';
import 'package:search_github_repository/service/firestore_service.dart';
import 'package:search_github_repository/utils/search_api.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController queryWordController = TextEditingController();
    final authState = ref.watch(authStateProvider);
    final searchHistoryAsyncValue = ref.watch(searchHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              authState.when(
                data: (user) {
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyPage(),
                      ),
                    );
                  } else {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const WelcomeDialog();
                      },
                    );
                  }
                },
                loading: () {},
                error: (error, stack) {},
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            // ログインしていれば「ログイン中」と表示する
            Container(
              child: authState.when(
                data: (user) => user != null
                    ? const Text('ログイン中')
                    : const Text('ログインしていません'),
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('エラー: $error'),
              ),
            ),
            Text(
              'Welcome!!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Search GitHub Repository',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.64,
                      child: TextFormField(
                        controller: queryWordController,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelText: 'Search',
                          hintText: 'Search GitHub Repository',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final String query = queryWordController.text;
                        final List result = await searchApi(query, context);
                        if (result.isNotEmpty) {
                          // 検索履歴を保存してから
                          createSearchHistory(query);
                          // 結果が空でない場合のみ遷移
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResultPage(result: result, query: query),
                            ),
                          );
                        }
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            authState.when(
              data: (user) {
                if (user != null) {
                  return Column(
                    children: [
                      const Text('最近の気になるトピック', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: SearchHistoryList(queryWordController: queryWordController),
                      ),
                    ],
                  );
                } else {
                  return const Text('検索履歴はログインすると表示されます');
                }
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('エラー: $error'),
            ),
          ],
        ),
      ),
    );
  }
}
