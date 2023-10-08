import 'package:flutter/material.dart';


class SignToText extends StatefulWidget {
  const SignToText({super.key});

  @override
  State<SignToText> createState() => _SignToTextState();
}

class _SignToTextState extends State<SignToText> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [

            SizedBox(height:120,),

            Center(
              child: Container(
                height: height*0.4,
                width: width *.90,
                color: Colors.amber,
                
                child: Text('gi'),



              ),
              
            ),







          ],


        ),
      ),



    );
  }
}
