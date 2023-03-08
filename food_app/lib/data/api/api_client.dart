import 'package:food_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  //Authorization token needed by the server
  late String token;
  //server url
  final String appBaseUrl;
  //request main headers
  late Map<String, String> _mainHeaders;

  //init getx parameters
  ApiClient({required this.appBaseUrl}){
    token = AppConstants.TOKEN;
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try {
      //this a http get request for the uri
      print("URI: " + uri.toString());
      Response response = await get(uri);
      print("Status: " + response.request.toString());
      return response;
    }
    catch(err){
      print(err.toString());
      return Response(statusCode: 1, statusText: err.toString());
    }
  }

}