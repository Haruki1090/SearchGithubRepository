import 'package:flutter/material.dart';
import 'package:search_github_repository/screens/create_account_screen.dart';
import 'package:search_github_repository/screens/login_screen.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text('Welcome to',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text('Search GitHub Repository',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            const Divider(),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'アカウントを作成いただくと、以下の便利な機能をご利用いただけます。\n\n'),
                  TextSpan(
                      text: '・ご自身の検索履歴の保持\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '・お気に入りのGitHubリポジトリの登録\n\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'これにより、情報を手軽に管理し、いつでも素早くアクセスできます。\n\n'),
                  TextSpan(
                      text: 'ぜひアカウントを作成して、これらの便利な機能をお楽しみください。',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen(),
                          ),
                        );
                      },
                      child: const Text('アカウント新規作成'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ),
                        );
                      },
                      child: const Text('ログイン'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
