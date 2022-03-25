import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/photo_model.dart';

class Controller extends GetxController {
  static Controller get to => Get.put<Controller>(Controller());
  List<Hit>? photos;
  bool loading=false;
  bool isEmpty=false;
   getPhotos({String search=""}) async {
    print("init api");
    loading=true;
    var response = await http.get(
        Uri.parse(
            "https://pixabay.com/api/?key=26311350-12b88ffcb07c67f5210a31767&image_type=photo&q=$search"),
        headers: {"Accept": "application/json"});
    loading=false;
    print("response ${response.statusCode}");
    PhotoModel photoModel = PhotoModel.fromJson(jsonDecode(response.body.toString()));
    if(photoModel.hits!.isEmpty){
      isEmpty=true;
    }else{
      isEmpty=false;
      photos=photoModel.hits;

    }
    update();
    print("api response $photoModel");


  }


}