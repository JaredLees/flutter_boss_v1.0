import 'package:bossapp/Compoments/MessageListItem.dart';
import 'package:flutter/material.dart';
import '../../Models/MessageModel.dart';

class MessageMain extends StatefulWidget {
  @override
  _MessageMainState createState() => _MessageMainState();
}

class _MessageMainState extends State<MessageMain> {
  List<MessageModel> _messages = [];
  void getMessageList() {
    setState(() {
      _messages = MessageModel.fromJson("""
          {
            "list": [
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              },
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              },
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              },
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              },
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              },
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              },
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              },
              {
                "avatar": "https://img.bosszhipin.com/beijin/mcs/useravatar/20180301/17aefca1b3d0dd6c5f94409e4c1e42a2cfcd208495d565ef66e7dff9f98764da_s.jpg",
                "name": "小可爱",
                "company": "百度",
                "position": "HR",
                "msg": "你好"
              }
            ]
          }
      """);
    });
  }

  @override
  void initState() {
    getMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('消 息',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: new ListView.builder(
          itemCount: _messages.length,
          itemBuilder: (context, index) => buildCompanyItem(context, index)),
    );
  }

  ///
  buildCompanyItem(BuildContext context, int index) {
    MessageModel message = _messages[index];

    var messageItem = new GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      content: new Text(
                    "尽情期待!",
                    style: new TextStyle(fontSize: 20.0),
                  )));
        },
        child: MessageListItem(message: message));

    return messageItem;
  }
}
