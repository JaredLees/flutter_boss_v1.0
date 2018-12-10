import 'package:bossapp/Compoments/JobListItem.dart';
import 'package:flutter/material.dart';
import '../../Models/JobModel.dart';

class JobMainScreen extends StatefulWidget {
  @override
  _JobMainScreenState createState() => _JobMainScreenState();
}

class _JobMainScreenState extends State<JobMainScreen> {
  List<JobModel> _jobs = [];

  void getJobList() {
    setState(() {
      _jobs = JobModel.fromJson("""
          {
            "list": [
              {
                "name": "架构师（Android）",
                "cname": "蚂蚁金服",
                "size": "B轮",
                "salary": "25k-45k",
                "username": "Claire",
                "title": "HR"
              },
              {
                "name": "资深Android架构师",
                "cname": "今日头条",
                "size": "D轮",
                "salary": "40k-60k",
                "username": "Kimi",
                "title": "HRBP"
              },
              {
                "name": "架构师（Android）",
                "cname": "蚂蚁金服",
                "size": "B轮",
                "salary": "25k-45k",
                "username": "Claire",
                "title": "HR"
              },
              {
                "name": "资深Android架构师",
                "cname": "今日头条",
                "size": "D轮",
                "salary": "40k-60k",
                "username": "Kimi",
                "title": "HRBP"
              },
              {
                "name": "架构师（Android）",
                "cname": "蚂蚁金服",
                "size": "B轮",
                "salary": "25k-45k",
                "username": "Claire",
                "title": "HR"
              },
              {
                "name": "资深Android架构师",
                "cname": "今日头条",
                "size": "D轮",
                "salary": "40k-60k",
                "username": "Kimi",
                "title": "HRBP"
              }
            ]
          }
      """);
    });
  }

  @override
  void initState() {
    getJobList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text('.Net Core',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: new ListView.builder(
          itemCount: _jobs.length,
          itemBuilder: (context, index) {
            return buildJobItem(context, index);
          }),
    );
  }

  buildJobItem(BuildContext context, int index) {
    JobModel job = _jobs[index];

    var jobItem = InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                    content: new Text(
                  '功能尚未开放...尽请期待!',
                  style: TextStyle(fontSize: 20.0),
                ));
              });
        },
        child: JobListItem(job: job));
    //用listtitle也可以
    // var jobItemC = ListTile(
    //     onTap: () {
    //       showDialog(
    //           context: context,
    //           builder: (context) {
    //             return new AlertDialog(
    //                 content: new Text(
    //               '功能尚未开放...尽请期待!',
    //               style: TextStyle(fontSize: 20.0),
    //             ));
    //           });
    //     },
    //     title: JobListItem(job: job));

    return jobItem;
  }
}
