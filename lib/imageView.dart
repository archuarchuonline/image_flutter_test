import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
 final String image;
  const ImageView({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: PhotoView(
        imageProvider: NetworkImage("$image",
        ),
      ),
    );
  }
}
