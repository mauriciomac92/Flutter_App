class ChatModel {
  final String name;
  final String message;

  ChatModel({this.name, this.message});

  static final List<ChatModel> dummyData = [
    ChatModel(
      name: "mauricio",
      message: "hello dude",
    ),
    ChatModel(
      name: "bro",
      message: "no",
    ),
  ];
}
