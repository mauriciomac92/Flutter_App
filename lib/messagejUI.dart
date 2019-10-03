class ChatModel {
  final String name;
  final String message;
  final String letter;

  ChatModel({this.name, this.message, this.letter});

  static final List<ChatModel> dummyData = [
    ChatModel(name: "mauricio", message: "hello dude", letter: 'M'),
    ChatModel(name: "bro", message: "no", letter: 'B'),
  ];
}
