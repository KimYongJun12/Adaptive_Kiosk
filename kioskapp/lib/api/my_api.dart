

import 'dart:convert';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> myApi(int age, String gender) async
{
  String url = "http://192.168.50.161:8080/response-json";
  final response = await http.post(url);
  print('sd');

  print(response);

  var responseJson = json.decode(response.body);
  print(responseJson);

  return responseJson;
  if(response.statusCode==200){
    var responseJson = json.decode(response.body);
    print(responseJson);

    return responseJson;
  }else{
    throw Exception('Failed to load server data');
  }




}


//Future<Map<String, dynamic>> naverApi(File f) async {
//  String _client_id = "RGO7PIuuhW5chyOr3kTV";
//  String _client_secret = "HFOSToSMIZ";
//  String url = "https://openapi.naver.com/v1/vision/face";
//
//  final fixedImageBytes = await FlutterImageCompress.compressWithFile(
//    f.path,
//    rotate: 0,
//    quality: 50,
//    keepExif: false,
//    autoCorrectionAngle: true,
//    format: CompressFormat.jpeg,
//  );
//
//  final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url));
//  request.headers['X-Naver-Client-Id'] = _client_id;
//  request.headers['X-Naver-Client-Secret'] = _client_secret;
//  request.files.add(http.MultipartFile.fromBytes('image', fixedImageBytes));
//
//  http.StreamedResponse streamedResponse = await request.send();
//  final http.Response response =
//  await http.Response.fromStream(streamedResponse);
//  Map<String, dynamic> resultJson = json.decode(response.body);
//  print(resultJson.toString());
//  return resultJson;
//}
