import 'package:ecommercewithfirebase/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String,String> _mainHeaders;
  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
     'Content-type':'application/json; charset=UTF-8',
   'Authorization' : 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async {
    try{
      print("Making api call to: $baseUrl$uri");
     Response response =  await get(uri,headers: _mainHeaders);
      print(" API Response Status: ${response.statusCode}");
      print(" API Response Headers: ${response.headers}");
     return response;
    }catch(e){
      print(" API Call Failed: $e");
      return Response(statusCode: 1, statusText:e.toString() );
    }
  }
}