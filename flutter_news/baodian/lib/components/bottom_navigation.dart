import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {

  final callback;

  BottomNavigation(this.callback);

  @override
  _BottomNavigationState createState() => new _BottomNavigationState();

}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
            icon: const Icon(Icons.language),
            title: Text("红包墙"),
            backgroundColor: Colors.blue
        ),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.local_library),
            title: Text("热点"),
            backgroundColor: Colors.blue[800]
        ),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.camera),
            title: Text("发布"),
            backgroundColor: Colors.blue
        ),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: Text("海淘"),
            backgroundColor: Colors.blue
        ),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.center_focus_strong),
            title: Text("我的"),
            backgroundColor: Colors.blue
        )
      ],
      currentIndex: _currentIndex,
      type: _type,
      
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          widget.callback(index);

        });
      },
    );
    return botNavBar;
  }
}