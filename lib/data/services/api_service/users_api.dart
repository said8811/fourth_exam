import 'package:dio/dio.dart';
import 'package:fifth_exam/data/models/my_response/my_responce.dart';
import 'package:fifth_exam/data/models/users/usersModel.dart';
import 'package:fifth_exam/data/services/api_service/api_client.dart';

class UsersApi extends ApiClient {
  Future<MyResponse> getUsers() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/users");

      if (response.statusCode == 200) {
        myResponse.data =
            (response.data as List).map((e) => Users.fromJson(e)).toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
