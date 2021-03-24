import 'package:equatable/equatable.dart';

class User extends Equatable{

  final String name;
  final String email;
  final bool prime;

  User({this.name, this.email, this.prime});

  @override
  // TODO: implement props
  List<Object> get props => [this.email];


  factory User.fromJson(Map<String , dynamic> json){
    return User(
      name: json['name'],
      email:json['email'],
      prime:json['prime']
    );
  }
}