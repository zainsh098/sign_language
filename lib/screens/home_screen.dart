import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language/font_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),

            
            Text('Sign Language Conversion',style: TextStyle(fontSize: 20,fontFamily: FontStyles.CarosSoftBold),),
            SizedBox(height: 40,),
            
            Center(
              child: Container(
                width: 380,
                height: 200,// Adjust the width as needed
                child: ElevatedButton(

                  style: ButtonStyle(

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(15),
                    shadowColor: MaterialStateProperty.all(Colors.blue.shade200),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {},
                  child: Column(children: [
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/text.png',width: 60,height: 60,),
                       FaIcon(FontAwesomeIcons.arrowRightLong,color: Colors.black,size: 40,),

                        Image.asset('assets/heart3.png',width: 60,height: 60,),

                      ],

                    ),
                    SizedBox(height: 22,),
                    Text('Write your word,sentence,phase etc and get to know how it is in sign language',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontFamily: FontStyles.CarosSoftLight,color: Colors.black,),),




                  ],),
                ),
              )


            ),
            SizedBox(height: 20,),
            Container(
              width: 380,
              height: 200,// Adjust the width as needed
              child: ElevatedButton(

                style: ButtonStyle(

                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(15),
                  shadowColor: MaterialStateProperty.all(Colors.blue.shade200),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {},
                child: Column(children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/heart2.png',width: 60,height: 60,),
                      FaIcon(FontAwesomeIcons.arrowRightLong,color: Colors.black,size: 40,),

                      Image.asset('assets/text.png',width: 60,height: 60,),

                    ],

                  ),
                  SizedBox(height: 22,),
                  Text('Show your sign language and gets \nit text in form of word,sentence,phase etc. ',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontFamily: FontStyles.CarosSoftLight,color: Colors.black,),),




                ],),
              ),
            )


          ],
        ),
      ),
    );
  }
}
