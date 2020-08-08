import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:legal_precedents/models/quote_model.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

//  final int number;
//  final String words;
//  final String author;
//  final String userId;
//  final String timeStamp;

  Stream<List<Quote>> getQuote() {
    return _db
        .collection("quotes")
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => Quote.fromJson(document.data))
            .toList());
  }

  Future<void> addQuote(int number, String words, String author, String userId,
      String timeStamp) {
    var dataMap = Map<String, dynamic>();
    dataMap["number"] = number;
    dataMap["words"] = words;
    dataMap["author"] = author;
    dataMap["userId"] = userId;
    dataMap["timeStamp"] = timeStamp;

    return _db.collection("quotes").add(dataMap);
  }
}
