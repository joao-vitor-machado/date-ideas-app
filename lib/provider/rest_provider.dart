import 'package:dio/dio.dart';
import 'package:trabalho_fibal_mob_2022/auth/manage_state.dart';
import 'package:trabalho_fibal_mob_2022/model/login.dart';

class RestServer {
  // Atributo que irá afunilar todas as consultas
  static RestServer helper = RestServer._createInstance();

  // Construtor privado
  RestServer._createInstance();

  final Dio _dio = Dio();
  String prefixUrl = "https://date-ideas-app-default-rtdb.firebaseio.com/";
  String suffixUrl = "/.json";

  Future<int> insertSignupData(SignupState signupData) async {
    try {
      Response response = await _dio.post(
        prefixUrl + suffixUrl,
        data: signupData.toMap(),
      );
    } catch (error) {
      print(error);
      return 400;
    }

    return 200;
  }
}
