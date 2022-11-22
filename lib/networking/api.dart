import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';

class Api{
   static String baseURL= "http://137.184.157.131:3000/";    //MobiOcean server
  // static String baseURL= "http://192.168.0.16:3000/";    //Jazz Home Wifi     //Local Host
  // static String baseURL= "http://192.168.10.6:3000/";    //Ptcl Home Wifi     //Local Host
  // static String baseURL= "http://192.168.18.19:3000/"; //Office Wifi   //Local Host
  // static String baseURL= "http://192.168.36.254:3000/";    // redmi Wifi     //Local Host
  static String apiErrorResponse = "Something went wrong! Please try again";

  static const ERROR = "error";
  static const SUCCESS = "success";



  //========GET========

   static Future<ApiResponse> get(String url) async {
     var dio = Dio();
     try {
       final response = await dio.get(url,);

       print ("response: " + response.toString());
       if (response.data != null && response.statusCode == 200 || response.statusCode == 201
           || response.statusCode == 202|| response.statusCode == 203
           || response.statusCode == 204 || response.statusCode == 205) {

         var jsonString = json.encode(response.data);
         return ApiResponse(jsonString, true);
       }
     } on DioError catch (e) {
       e.printError();
       if (e.response != null) {
         print('has response' + e.response?.data ?? "");
       }
     }
     return ApiResponse(null, true);
   }

   //========POST========

   // static Future<ApiResponse> post(String url, Map<String, dynamic> map) async {
   static Future<ApiResponse> post(String url, String jsonString) async {
     var dio = Dio();
     try {
       final response = await dio.post(url,
           data: jsonString,
           options: Options(headers: {
             HttpHeaders.contentTypeHeader: "application/json",
           }));

       print ("response: " + response.toString());
       if (response.data != null && response.statusCode == 200 || response.statusCode == 201
           || response.statusCode == 202|| response.statusCode == 203
           || response.statusCode == 204 || response.statusCode == 205) {

         var jsonString = json.encode(response.data);
         return ApiResponse(jsonString, true);
       }
     } on DioError catch (e) {
       e.printError();
       if (e.response != null) {
         print('has response' + e.response?.data ?? "");
       }
     }
     return ApiResponse(null, true);
   }

//========PATCH========

  static Future<ApiResponse> patch(String url, String jsonString) async {
    var dio = Dio();
    try {
      final response = await dio.patch(url,
          data: jsonString,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      print ("response: " + response.toString());
      if (response.data != null && response.statusCode == 200 || response.statusCode == 201
          || response.statusCode == 202|| response.statusCode == 203
          || response.statusCode == 204 || response.statusCode == 205) {

        var jsonString = json.encode(response.data);
        return ApiResponse(jsonString, true);
      }
    } on DioError catch (e) {
      e.printError();
      if (e.response != null) {
        print('has response' + e.response?.data ?? "");
      }
    }
    return ApiResponse(null, true);
  }

   //=======DELETE=======

   static Future<ApiResponse> delete(String url) async {
     var dio = Dio();
     try {
       final response = await dio.delete(url,);

       print ("response: " + response.toString());
       if (response.data != null && response.statusCode == 200 || response.statusCode == 201
           || response.statusCode == 202|| response.statusCode == 203
           || response.statusCode == 204 || response.statusCode == 205) {

         var jsonString = json.encode(response.data);
         return ApiResponse(jsonString, true);
       }
     } on DioError catch (e) {
       e.printError();
       if (e.response != null) {
         print('has response' + e.response?.data ?? "");
       }
     }
     return ApiResponse(null, true);
   }


}



class ApiResponse{
  dynamic? body;
  bool isSuccess;

  ApiResponse(this.body, this.isSuccess){

  }
}