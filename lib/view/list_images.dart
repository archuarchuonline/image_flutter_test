
import 'dart:async';

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
          initState: (data) {   _internetCheck();
          Controller.to.getPhotos();
          },
          builder: (data) => SafeArea(
            child: Column(
              children: [_searchbox(controller:data), _listPhotos(controller:data)],
            ),
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



_internetCheck()async{
  print('''The statement 'this machine is connected to the Internet' is: ''');
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  // ignore: avoid_print
  print(
    isConnected.toString(),
  );
  // returns a bool

  // We can also get an enum instead of a bool
  // ignore: avoid_print
  print(
      'Current status: ${await InternetConnectionChecker().connectionStatus}');
  // Prints either InternetConnectionStatus.connected
  // or InternetConnectionStatus.disconnected

  // actively listen for status updates
  final StreamSubscription<InternetConnectionStatus> listener =
  InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
        // ignore: avoid_print
          print('Data connection is available.');
          Get.offAll(()=> Screen());
          break;
        case InternetConnectionStatus.disconnected:
        // ignore: avoid_print
          Get.to(()=>NoInternet());
          print('You are disconnected from the internet.');
          break;
      }
    },
  );

  // close listener after 30 seconds, so the program doesn't run forever
  // await Future<void>.delayed(const Duration(seconds: 30));
  // await listener.cancel();
}