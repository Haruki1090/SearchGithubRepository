// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_github_repository/components/my_page.dart';
import 'package:search_github_repository/components/welcome_dialog.dart';
import 'package:search_github_repository/screens/result_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:search_github_repository/service/auth.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController queryWordController = TextEditingController();
    final authState = ref.watch(authStateProvider);

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
            // ログインしていれば「ログイン中」と表示する
            Container(
              child: authState.when(
                data: (user) => user != null ? const Text('ログイン中') : const Text('ログインしていません'),
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
          ],
        ),
      ),
    );
  }

  showProgressIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<List> searchApi(String query, BuildContext context) async {
    try {
      showProgressIndicator(context);
      final response = await http.get(
          Uri.parse('https://api.github.com/search/repositories?q=$query'));
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['items'] as List;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('エラーが発生しました。再度やり直してください。'),
                content: Text('エラーコード: ${response.statusCode}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
        return []; // 空のリストを返して、遷移を防ぐ
      }
    } catch (e) {
      return []; // エラー時にも空のリストを返す
    }
  }
}
