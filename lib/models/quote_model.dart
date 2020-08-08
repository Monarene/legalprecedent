class Quote {
  final int number;
  final String words;
  final String author;
  final String userId;
  final String timeStamp;

  Quote({this.number, this.words, this.author, this.userId, this.timeStamp});

  Quote.fromJson(Map<String, dynamic> parsedJson)
      : number = parsedJson["number"],
        words = parsedJson["words"],
        author = parsedJson["author"],
        userId = parsedJson["userId"],
        timeStamp = parsedJson["timeStamp"];
}
