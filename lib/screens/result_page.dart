import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.result});

  final List result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body: ListView.builder(
        itemCount: result.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(result[index]['full_name']),
            subtitle: Text(result[index]['description']),
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
          );
        },
      ),
    );
  }
}