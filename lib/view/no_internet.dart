import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image.asset("assets/images/no_internet.png"),
          const  SizedBox(height: 30,),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.0),
            child: Text("No Internet available, Please make sure your connection is available",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}