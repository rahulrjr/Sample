import 'dart:async';
import 'dart:convert';

import 'package:animoto/mocks/model/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserInitialEvent) {
      yield UserLoadingState();
    }
    if (event is LoadAccountEvent) {
      User user = await loadFromAsset();
      yield UserLoadedState(user);
    }
  }
}

Future<User> loadFromAsset() async {
  var response = await rootBundle.loadString("assets/resources/users.json");
  print('Response:    $response');
  return createTemplateModel(response);
}

User createTemplateModel(jsonString) {
  var jsonResult = jsonDecode(jsonString);
  print(jsonResult);

  User user = User.fromJson(jsonResult);
  return user;
}
