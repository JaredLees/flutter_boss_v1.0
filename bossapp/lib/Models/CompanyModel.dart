import 'dart:convert';

import 'package:meta/meta.dart';

///定义Companymodel
class CompanyModel {
  CompanyModel(
      {@required this.logo,
      @required this.name,
      @required this.location,
      @required this.type,
      @required this.size,
      @required this.employee,
      @required this.hot,
      @required this.count,
      @required this.inc});
  final String logo; // logo
  final String name; // 公司名称
  final String location; // 公司位置
  final String type; // 公司性质
  final String size; // 公司规模
  final String employee; // 公司人数
  final String hot; // 热招职位
  final String count; // 职位总数
  final String inc; // 公司详情

  static List<CompanyModel> fromJson(String json) {
    List<CompanyModel> listModel = new List<CompanyModel>();
    List list = jsonDecode(json)['list'];
    list.forEach((v) {
      var model = fromMap(v);
      listModel.add(model);
    });

    return listModel;
  }

  static CompanyModel fromMap(Map map) {
    return new CompanyModel(
        logo: map['logo'],
        name: map['name'],
        location: map['location'],
        type: map['type'],
        size: map['size'],
        employee: map['employee'],
        hot: map['hot'],
        count: map['count'],
        inc: map['inc']);
  }
}
