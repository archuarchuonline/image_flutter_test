
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cstask/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'imageView.dart';
import 'no_internet.dart';

class Screen extends StatelessWidget {
   Screen({Key? key}) : super(key: key);
Color themeColor=Colors.orange;
@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<Controller>(
          init: Controller(),
          initState: (data)async {
            await Controller.to.internetCheck();
          Controller.to.getPhotos();
          },
          builder: (data) => SafeArea(
            child:
            data.internetAccess==true?
            Column(
              children: [_searchbox(controller:data), _listPhotos(controller:data)],
            ):
           const NoInternet(),
          ),
        ));
  }
   Widget _searchbox({required controller}) {
     return Container(
       width: Get.width*0.98,
       child: Column(
         children: [
           Container(
             margin: const EdgeInsets.symmetric(horizontal:15,vertical: 20),
             child: TextFormField(
               onChanged: (data){
                 print("typed value $data");
                 controller.getPhotos(search:data);
               },
               style: TextStyle(
                   color: themeColor,
                   fontSize: 19,
                   fontWeight: FontWeight.w400
               ),
               decoration: InputDecoration(
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: themeColor, width: 2.0,),
                     borderRadius: BorderRadius.circular(20),

                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: themeColor, width: 2.0),
                     borderRadius: BorderRadius.circular(20),

                   ),
                   hintText: 'Search',
                   hintStyle:  TextStyle(
                       color: themeColor
                   ),
                   suffixIcon: InkWell(
                     onTap: () {

                     },
                     child: Icon(Icons.search,
                         color:themeColor),
                   )),
             ),
           ),
         ],
       ),
     );
   }

   Widget _listPhotos({required  controller }) {
     return Expanded(
       child:
       controller.loading==true?
        Center(child: CircularProgressIndicator(
         color: themeColor,
       )):
       controller.isEmpty==true?
       Container(
         child: Center(
           child: Column(
             children: [
               Expanded(
                 child: Image.asset("assets/images/empty.png"),
               ),
             ],
           ),
         ),
       )
           :
       GridView.builder(
         shrinkWrap: true,
         itemCount: controller.photos.length,
         padding: const EdgeInsets.all(20),
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             crossAxisSpacing: 10,
             mainAxisSpacing: 10,
             childAspectRatio: 2.1 / 2.1),
         itemBuilder: (BuildContext context, int index) {
           return InkWell(
             onTap: (){
               print("clicked");
               Get.to(()=>ImageView(image:controller.photos[index].largeImageUrl));
             },
             child: Container(
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20.0),
                   color: Colors.red[50],
                   boxShadow: [
                     BoxShadow(color: Colors.grey.withAlpha(80),
                         offset:const Offset(0,2),
                         blurRadius: 5)
                   ]),
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(20),
                 child: Image.network(
                     "${controller.photos[index].previewUrl}",
                     height: 100,
                     fit: BoxFit.cover,
                     loadingBuilder: (BuildContext context, Widget child,
                         ImageChunkEvent? loadingProgress) {
                       if (loadingProgress == null) return child;
                       return Center(
                         child: CircularProgressIndicator(
                           color: Colors.red,
                           value: loadingProgress.expectedTotalBytes != null
                               ? loadingProgress.cumulativeBytesLoaded /
                               loadingProgress.expectedTotalBytes!
                               : null,
                         ),
                       );
                     }       ),
               ),
             ),
           );
         },
       ),
     );
   }

}



