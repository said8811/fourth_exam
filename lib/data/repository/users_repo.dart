import 'package:fifth_exam/data/models/my_response/my_response.dart';
import 'package:fifth_exam/data/services/api_service/users_api.dart';

class USerRepository {
  final UsersApi usersApi;
  USerRepository({required this.usersApi});

  Future<MyResponse> getUsers() => usersApi.getUsers();
}
