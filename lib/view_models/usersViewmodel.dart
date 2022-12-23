import 'package:fifth_exam/data/models/my_response/my_responce.dart';
import 'package:fifth_exam/data/models/users/usersModel.dart';
import 'package:fifth_exam/data/repository/users_repo.dart';
import 'package:flutter/cupertino.dart';

class UserViewModel extends ChangeNotifier {
  late USerRepository _uSerRepository;
  List<Users>? users;
  String error = '';

  UserViewModel({required USerRepository uSerRepository}) {
    _uSerRepository = uSerRepository;
    getUsers();
  }

  getUsers() async {
    MyResponse response = await _uSerRepository.getUsers();
    if (response.error.isEmpty) {
      users = response.data as List<Users>;
    } else {
      error = response.error;
    }
    notifyListeners();
  }
}
