import 'dart:async';

import 'package:cstask/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'view/imageView.dart';
import 'view/list_images.dart';

void main() async{
  runApp( GetMaterialApp(
    home:  Screen(),
    debugShowCheckedModeBanner: false,
  ));
}




