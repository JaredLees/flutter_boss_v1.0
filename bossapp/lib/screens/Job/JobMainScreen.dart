import 'dart:io';

import 'package:bossapp/Compoments/JobListItem.dart';
import 'package:bossapp/compoments/pullpush/pull_push.dart';
import 'package:flutter/material.dart';
import '../../Models/JobModel.dart';

class JobMainScreen extends StatefulWidget {
  @override
  _JobMainScreenState createState() => _JobMainScreenState();
}

class _JobMainScreenState extends State<JobMainScreen>
    with TickerProviderStateMixin {
  List<JobModel> _jobs = [];
  ScrollController controller = new ScrollController();
  ScrollPhysics scrollPhysics = new RefreshAlwaysScrollPhysics();

  //使用系统的请求
  var httpClient = new HttpClient();
  var url = "https://github.com/";
  var _result = "";
  String customRefreshBoxIconPath = "assets/images/icon_arrow.png";
  AnimationController customBoxWaitAnimation;
  int rotationAngle = 0;
  String customHeaderTipText = "快尼玛给老子松手！";
  String defaultRefreshBoxTipText = "快尼玛给老子松手！";

  ///button等其他方式，通过方法调用触发下拉刷新
  TriggerPullController triggerPullController = new TriggerPullController();

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
    //这个是刷新时控件旋转的动画，用来使刷新的Icon动起来
    customBoxWaitAnimation = new AnimationController(
        duration: const Duration(milliseconds: 1000 * 100), vsync: this);
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
      body: PullAndPush(
        //如果你headerRefreshBox和footerRefreshBox全都自定义了，则default**系列的属性均无效，
        //假如有一个RefreshBox是用默认的（在该RefreshBox Enable的情况下）则default**系列的属性均有效
        defaultRefreshBoxTipText: defaultRefreshBoxTipText,
        headerRefreshBox: _getCustomHeaderBox(),
        triggerPullController: triggerPullController,

        //你也可以自定义底部的刷新栏；you can customize the bottom refresh box
        animationStateChangedCallback: (AnimationStates animationStates,
            RefreshBoxDirectionStatus refreshBoxDirectionStatus) {
          _handleStateCallback(animationStates, refreshBoxDirectionStatus);
        },
        listView: new ListView.builder(
            itemCount: _jobs.length,
            itemBuilder: (context, index) {
              return buildJobItem(context, index);
            }),

        loadData: (isPullDown) async {
          await _loadData(isPullDown);
        },
        scrollPhysicsChanged: (ScrollPhysics physics) {
          //这个不用改，照抄即可；This does not need to change，only copy it
          setState(() {
            scrollPhysics = physics;
          });
        },
      ),
    );
  }

  ///
  Widget _getCustomHeaderBox() {
    return new Container(
        color: Color.fromARGB(255, 0, 215, 198),//Colors.grey,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Align(
              alignment: Alignment.centerLeft,
              child: new RotatedBox(
                quarterTurns: rotationAngle,
                child: new RotationTransition(
                  //布局中加载时动画的weight
                  child: new Image.asset(
                    customRefreshBoxIconPath,
                    height: 45.0,
                    width: 45.0,
                    fit: BoxFit.cover,
                  ),
                  turns: new Tween(begin: 100.0, end: 0.0)
                      .animate(customBoxWaitAnimation)
                        ..addStatusListener((animationStatus) {
                          if (animationStatus == AnimationStatus.completed) {
                            customBoxWaitAnimation.repeat();
                          }
                        }),
                ),
              ),
            ),
            new Align(
              alignment: Alignment.centerRight,
              child: new ClipRect(
                child: new Text(
                  customHeaderTipText,
                  style:
                      new TextStyle(fontSize: 18.0, color: Color(0xffe6e6e6)),
                ),
              ),
            ),
          ],
        ));
  }

  void _handleStateCallback(AnimationStates animationStates,
      RefreshBoxDirectionStatus refreshBoxDirectionStatus) {
    switch (animationStates) {
      //RefreshBox高度达到50,上下拉刷新可用;RefreshBox height reached 50，the function of load data is  available
      case AnimationStates.DragAndRefreshEnabled:
        setState(() {
          //3.141592653589793是弧度，角度为180度,旋转180度；3.141592653589793 is radians，angle is 180⁰，Rotate 180⁰
          rotationAngle = 2;
        });
        break;

      //开始加载数据时；When loading data starts
      case AnimationStates.StartLoadData:
        setState(() {
          customRefreshBoxIconPath = "assets/images/refresh.png";
          customHeaderTipText = "正在拼命加载.....";
        });
        customBoxWaitAnimation.forward();
        break;

      //加载完数据时；RefreshBox会留在屏幕2秒，并不马上消失，这里可以提示用户加载成功或者失败
      case AnimationStates.LoadDataEnd:
        customBoxWaitAnimation.reset();
        setState(() {
          rotationAngle = 0;
          if (refreshBoxDirectionStatus == RefreshBoxDirectionStatus.PULL) {
            customRefreshBoxIconPath = "assets/images/icon_cry.png";
            customHeaderTipText = "加载失败！请重试";
          } else if (refreshBoxDirectionStatus ==
              RefreshBoxDirectionStatus.PUSH) {
            defaultRefreshBoxTipText = "可提示用户加载成功Or失败";
          }
        });
        break;

      //RefreshBox已经消失，并且闲置；RefreshBox has disappeared and is idle
      case AnimationStates.RefreshBoxIdle:
        setState(() {
          rotationAngle = 0;
          defaultRefreshBoxTipText = customHeaderTipText = "释放刷新！";
          customRefreshBoxIconPath = "assets/images/icon_arrow.png";
        });
        break;
    }
  }

  Future _loadData(bool isPullDown) async {
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        // _result = await response.transform(utf8.decoder).join();
        // setState(() {
        //   //拿到数据后，对数据进行梳理
        //   if(isPullDown){
        //     strs.clear();
        //     strs.addAll(addStrs);
        //   }else{
        //     strs.addAll(addStrs);
        //   }
        // });
        print('isPullDown');
      } else {
        _result = 'error code : ${response.statusCode}';
      }
    } catch (exception) {
      _result = '网络异常';
    }
    print(_result);
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
