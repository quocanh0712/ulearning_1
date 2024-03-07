

import 'package:ulearning_1/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters:params?.toJson()
    );

    return UserLoginResponseEntity.fromJson(response);


  }
}