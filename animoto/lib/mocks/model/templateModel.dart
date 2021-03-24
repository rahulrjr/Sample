import 'package:equatable/equatable.dart';

class TemplateModel extends Equatable {
  final String imagePath;
  final String name;
  final String description;

  TemplateModel({this.imagePath, this.name, this.description});

  @override
  // TODO: implement props
  List<Object> get props => [this.name, this.description];

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
        imagePath: json['image'],
        name: json['name'],
        description: json['description']);
  }
}
