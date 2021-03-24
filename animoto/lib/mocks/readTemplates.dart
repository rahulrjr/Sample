import 'dart:convert';

import 'package:animoto/mocks/model/templateModel.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';

List<TemplateModel> templateList = [];

Future<List<TemplateModel>> loadFromAsset() async {
  var response = await rootBundle.loadString("assets/resources/templates.json");
  print(response);
  return createTemplateModel(response);
}

List<TemplateModel> createTemplateModel(jsonString) {
  
  // method 1
  // var jsonResult = jsonDecode(jsonString);
  // print(jsonResult);

  // var data = TemplateModel.fromJson(jsonResult);

  // templateList.add(data);

  // print(data);
  // for (var template in jsonResult['templates']) {
  //   print("name =  ${template['name']}");
  //   String imagePath = template['image'];
  //   String name = template['name'];
  //   String desc = template['description'];

  //   templateList.add(
  //       TemplateModel(imagePath: imagePath, name: name, description: desc));


  // }
  // return templateList;


  // method 2
  var jsonResult = jsonDecode(jsonString)['templates'] as List;
  print(jsonResult);
  List<TemplateModel> list = jsonResult.map((val) => TemplateModel.fromJson(val)).toList();


  
  return list;
}
