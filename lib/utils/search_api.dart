// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_github_repository/utils/loading_indicator.dart';

Future<List> searchApi(String query, BuildContext context) async {
  try {
    showLoadingIndicator(context);
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