import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:lujain/domain/repos/usersRepo.dart';
import '../../Models/userModel.dart';
import 'States.dart';

class UsersCubit extends Cubit<States> with UsersRepos {
  UsersCubit() : super(InitialStates());

  static UsersCubit get(context) => BlocProvider.of(context);

  final baseUrl = 'https://jsonplaceholder.typicode.com';
  var userModel = <UserModel>[];

  @override
  getAllUsers() async {
    emit(UsersGetLoadingStates());
    await http.get(Uri.parse('$baseUrl/users')).then((value) {
      var decodeJson = json.decode(value.body);
      for (var usersInfo in decodeJson) {
        userModel.add(UserModel.fromJson(usersInfo));
      }
      userModel =
          decodeJson.map<UserModel>((rr) => UserModel.fromJson(rr)).toList();
      emit(UsersGetSuccessfullyStates());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(UsersGetErrorStates());
    });
  }
}
