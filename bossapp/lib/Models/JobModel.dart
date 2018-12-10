import 'dart:convert';

import 'package:meta/meta.dart';

///定义jobModel
class JobModel {
  JobModel(
      {@required this.name,
      @required this.cname,
      @required this.size,
      @required this.salary,
      @required this.username,
      @required this.title});
  final String name;
  final String cname;
  final String size;
  final String salary;
  final String username;
  final String title;

  static List<JobModel> fromJson(String json) {
    List<JobModel> listModel = new List<JobModel>();
    List list = jsonDecode(json)['list'];
    list.forEach((v){
      var model= JobModel.fromMap(v);
      listModel.add(model);
    });
    return listModel;
  }

  static JobModel fromMap(Map map) {
    return new JobModel(
        name: map['name'],
        cname: map['cname'],
        size: map['size'],
        salary: map['salary'],
        username: map['username'],
        title: map['title']);
  }
}
