import 'package:flutter/material.dart';
import '../Config/Constant.dart';

class IconTab extends StatefulWidget {
  const IconTab({
    Key key,
    this.text,
    this.icon,
    this.color,
    this.height=30.0,
    this.width=30.0
  })  : assert(text != null || icon != null || color != null),
        super(key: key);

  final String text;
  final String icon;
  final Color color;
  ///tabBarImageSize_width
  final double width;
  ///tabBarImageSize_height
  final double height;
  @override
  _IconTabState createState() => _IconTabState();
}

class _IconTabState extends State<IconTab> {
  ///
  Widget _buildLabelText() {
    return new Text(
      widget.text,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: new TextStyle(color: widget.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    double height = Constant.kTextAndIconTabHeight;
    Widget label = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Image(
              image: new AssetImage(widget.icon),
              height: widget.height,//Constant.TabImageHeight,//30.0,
              width: widget.width,//Constant.TabImageWidth,
            ),
            margin: const EdgeInsets.only(bottom: Constant.kMarginBottom),
          ),
          _buildLabelText()
        ]);
    return SizedBox(
      height: height,
      child: new Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }
}
