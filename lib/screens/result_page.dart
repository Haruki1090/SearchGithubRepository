import 'package:flutter/material.dart';
import 'package:search_github_repository/screens/detail_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.result, required this.query});

  final String query;
  final List result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(query),
      ),
      body: ListView.builder(
        // 上位20件のみ表示
        itemCount: result.length > 20 ? 20 : result.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(result[index]['owner']['avatar_url']),
              ),
              title: Text(result[index]['full_name']),
              subtitle: Text(result[index]['description'] ?? 'No description'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      repository: result[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
