import 'package:flutter/material.dart';
import '../Compoments/IconTab.dart';
import '../Config/Constant.dart';
import '../screens/message/MessageMain.dart';
import '../screens/job/JobMainScreen.dart';
import '../screens/mine/MineMain.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          children: <Widget>[
            //JobMainScreen(),
            JobMainScreen(),
            new Text('CompanyTab--公司'),
            MessageMain(),
            MineMain()
          ],
          controller: _controller,
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
        ));
  }
}
