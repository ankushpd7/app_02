class Messages {
  String msg;
  String time;
  String otherPersonName;
  bool isSend;
  String? imgUrl;

  Messages({
    required this.msg,
    required this.time,
    required this.otherPersonName,
    this.isSend = false,
    this.imgUrl
  });
}
