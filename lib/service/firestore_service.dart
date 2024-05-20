import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future createSearchHistory(String query) async {
  final user = FirebaseAuth.instance.currentUser;
  final queryHistory = query;
  final createdAt = Timestamp.now();
  final document = FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('search_history').doc();
  await document.set({
    'queryHistory': queryHistory,
    'createdAt': createdAt,
    'updatedAt': createdAt,
    'favorite': false,
  });
}