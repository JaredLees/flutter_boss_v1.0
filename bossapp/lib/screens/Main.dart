import 'package:flutter/material.dart';
import '../Compoments/IconTab.dart';
import '../Config/Constant.dart';
import '../screens/message/MessageMain.dart';
import '../screens/job/JobMainScreen.dart';
import '../screens/mine/MineMain.dart';
import '../screens/company/CompanyMain.dart';
import 'package:fluttertoast/fluttertoast.dart';

///程序主入口
class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;

  @override
  void initState() {
    _controller = new TabController(
      initialIndex: _currentIndex,
      length: 4,
      vsync: this,
    );
    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  DateTime _lastPressedAt;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          Fluttertoast.showToast(
              msg: '再按一次退出应用', toastLength: Toast.LENGTH_SHORT);
          return false;
        }
        return true;
      },
      child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              JobMainScreen(),
              CompanyMain(),
              MessageMain(),
              MineMain()
            ],
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: Material(
            color: Colors.white,
            child: TabBar(
              controller: _controller,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: new TextStyle(fontSize: Constant.kTabTextSize),
              tabs: <IconTab>[
                IconTab(
                  icon: _currentIndex == Constant.INDEX_JOB
                      ? "assets/images/ic_main_tab_find_pre.png"
                      : "assets/images/ic_main_tab_find_nor.png",
                  text: "职位",
                  color: _currentIndex == Constant.INDEX_JOB
                      ? Constant.kPrimaryColor
                      : Colors.grey[900],
                  height: Constant.TabImageHeight,
                  width: Constant.TabImageWidth,
                ),
                IconTab(
                  icon: _currentIndex == Constant.INDEX_COMPANY
                      ? "assets/images/ic_main_tab_company_pre.png"
                      : "assets/images/ic_main_tab_company_nor.png",
                  text: "公司",
                  color: _currentIndex == Constant.INDEX_COMPANY
                      ? Constant.kPrimaryColor
                      : Colors.grey[900],
                  height: Constant.TabImageHeight,
                  width: Constant.TabImageWidth,
                ),
                IconTab(
                  icon: _currentIndex == Constant.INDEX_MESSAGE
                      ? "assets/images/ic_main_tab_contacts_pre.png"
                      : "assets/images/ic_main_tab_contacts_nor.png",
                  text: "消息",
                  color: _currentIndex == Constant.INDEX_MESSAGE
                      ? Constant.kPrimaryColor
                      : Colors.grey[900],
                  height: Constant.TabImageHeight,
                  width: Constant.TabImageWidth,
                ),
                IconTab(
                  icon: _currentIndex == Constant.INDEX_MINE
                      ? "assets/images/ic_main_tab_my_pre.png"
                      : "assets/images/ic_main_tab_my_nor.png",
                  text: "我的",
                  color: _currentIndex == Constant.INDEX_MINE
                      ? Constant.kPrimaryColor
                      : Colors.grey[900],
                  height: Constant.TabImageHeight,
                  width: Constant.TabImageWidth,
                ),
              ],
            ),
          )),
    );
  }
}
