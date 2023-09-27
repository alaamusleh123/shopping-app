import 'package:dio/dio.dart';

class DioProduct{
late Dio dio;
DioProduct(){
  dio= Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10)
    ),
  );
}
Future<Response> getAllProduct({required String path}) async{
  dio.options.headers= {
    'lang' : 'en',
  };
  Response response = await dio.get(path);
  return response;
}

Future<Response> postData({required String path, required Map<String,dynamic> data}) async{
  Response response= await dio.post(path, data: data);
  return response;
}
}