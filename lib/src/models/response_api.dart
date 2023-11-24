import 'dart:convert';

import 'package:get/get.dart';

// inport 'dart:Converter'

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi{

    bool? success;
    String? messege;
    dynamic data;

    ResponseApi({
      this.success,
      this.messege,
      this.data
    });

    factory ResponseApi.fromJson(Map<String, dynamic>json) => ResponseApi(
      success: json["success"],
      messege: json["message"],
      data: json["data"],
    );

    Map<String, dynamic> toJson() =>{
      "success": success,
      "message": messege,
      "data":data,
    };
}