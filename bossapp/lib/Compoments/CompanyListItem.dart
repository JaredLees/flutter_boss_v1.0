import 'package:flutter/material.dart';
import '../Models/CompanyModel.dart';

class CompanyListItem extends StatelessWidget {
  //CompanyListItem({Key key, this.companyModel}) : super(key: key);
  CompanyListItem({this.companyModel});
  final CompanyModel companyModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 3.0,
        left: 5.0,
        right: 5.0,
        bottom: 3.0,
      ),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 15.0,
                      right: 15.0,
                      bottom: 0.0,
                    ),
                    child: Image.network(
                      companyModel.logo,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 0.0,
                      right: 5.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      companyModel.location.substring(
                          0, companyModel.location.length > 6 ? 6 : 1),
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 0.0,
                      right: 5.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      companyModel.type +
                          " | " +
                          companyModel.size +
                          " | " +
                          companyModel.employee,
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 10.0,
                      right: 5.0,
                      bottom: 15.0,
                    ),
                    child: new Text(
                        "热招：" +
                            companyModel.hot +
                            " 等" +
                            companyModel.count +
                            "个职位",
                        style:
                            new TextStyle(fontSize: 13.0, color: Colors.grey)),
                  ),
                  new Expanded(
                      child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
