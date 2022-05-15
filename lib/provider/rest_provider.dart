// import 'package:dio/dio.dart';

// import 'package:trabalho_fibal_mob_2022/model/login.dart';

// class RestServer {
//   // Atributo que irá afunilar todas as consultas
//   static RestServer helper = RestServer._createInstance();

//   // Construtor privado
//   RestServer._createInstance();

//   final Dio _dio = Dio();
//   String prefixUrl = "https://date-ideas-app-default-rtdb.firebaseio.com/";
//   String suffixUrl = "/.json";

//   Future<LoginData> getData() async {
//     Response response = await _dio.get(
//         prefixUrl + LoginData + suffixUrl); //recebe o json, transforma em map
//     return LoginData.fromMap(response.data);
//   }

//   Future<int> insertLoginData(LoginData loginData) async {
//     Response response = await _dio.post(
//       prefixUrl + suffixUrl,
//       data: loginData.toMap(),
//     );
//   }
// }
