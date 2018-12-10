import 'package:bossapp/Compoments/DotsIndicator.dart';
import 'package:bossapp/Config/Constant.dart';
import 'package:bossapp/Models/CompanyModel.dart';
import 'package:bossapp/screens/company/CompanyHotJob.dart';
import 'package:bossapp/screens/company/CompanyInc.dart';
import 'package:bossapp/screens/company/CompanyInfo.dart';
import 'package:flutter/material.dart';

class CompanyDetail extends StatefulWidget {
  CompanyDetail(this._company);
  final CompanyModel _company;
  @override
  _CompanyDetailState createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _imagePages;
  TabController _controller;
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];
  Widget _companyTabContent;
  VoidCallback onChanged;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    if (_urls.isNotEmpty) {
      _imagePages = <Widget>[];
      _urls.forEach((String url) {
        _imagePages.add(Container(
            color: Colors.black.withAlpha(900),
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                height: Constant.ComDetailAppBarHeight,
              ),
            )));
      });
    }

    ///
    _tabs = [
      new Tab(text: '公司概况'),
      new Tab(text: '热招职位'),
    ];
    _companyTabContent = new CompanyInc(company: widget._company.inc);
    _controller = new TabController(length: _tabs.length, vsync: this);

    onChanged = () {
      setState(() {
        if (_currentIndex == 0) {
          _companyTabContent = CompanyInc(company: widget._company.inc);
        } else {
          _companyTabContent = new CompanyHotJob();
        }
        _currentIndex = this._controller.index;
      });
    };
    _controller.addListener(onChanged);
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
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
              child: new Column(
            children: <Widget>[
              new SizedBox.fromSize(
                size: const Size.fromHeight(Constant.ComDetailAppBarHeight),
                child: IndicatorViewPager(pages: _imagePages),
              ),
              new Container(
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new CompanyInfo(company: widget._company),
                    new Divider(),
                    new TabBar(
                      indicatorWeight: 3.0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: new TextStyle(fontSize: 16.0),
                      labelColor: Colors.black,
                      controller: _controller,
                      tabs: _tabs,
                      indicatorColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              _companyTabContent
            ],
          )),
        ],
      ),
    );
  }
}
