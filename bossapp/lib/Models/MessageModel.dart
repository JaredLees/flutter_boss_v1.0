import 'dart:convert';

import 'package:meta/meta.dart';

///定义消息模型
class MessageModel {
  MessageModel({
    @required this.name,
    @required this.avatar,
    @required this.company,
    @required this.position,
    @required this.msg,
  });
  final String name;
  final String avatar;
  final String company;
  final String position;
  final String msg;

  static List<MessageModel> fromJson(String json) {
    List<MessageModel> listModel = new List<MessageModel>();
    List list = jsonDecode(json)['list'];
    list.forEach((v) {
      var model = fromMap(v);
      listModel.add(model);
    });
    return listModel;
    // return jsonDecode(json)['list']
    //     .map((obj) => MessageModel.fromMap(obj))
    //     .toList();
  }

  static MessageModel fromMap(Map map) {
    return new MessageModel(
        name: map['name'],
        avatar: map['avatar'],
        company: map['company'],
        position: map['position'],
        msg: map['msg']);
  }
}
