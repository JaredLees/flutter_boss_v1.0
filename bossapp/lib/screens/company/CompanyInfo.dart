import 'package:bossapp/Models/CompanyModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  CompanyInfo({@required this.company});
  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: 15.0,
                  right: 15.0,
                  bottom: 0.0,
                ),
                child: Image.network(
                  company.logo,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Text(
                        company.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        left: 0.0,
                        right: 5.0,
                        bottom: 5.0,
                      ),
                      child: Text(company.location,
                          style: TextStyle(fontSize: 13.0, color: Colors.grey)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        left: 0.0,
                        right: 5.0,
                        bottom: 5.0,
                      ),
                      child: Text(
                          company.type +
                              " | " +
                              company.size +
                              " | " +
                              company.employee,
                          style: TextStyle(fontSize: 13.0, color: Colors.grey)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
