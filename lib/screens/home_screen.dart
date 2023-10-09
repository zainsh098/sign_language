import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language/font_styles.dart';
import 'package:sign_language/screens/bottom_sheet/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(


          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text:   TextSpan(
                    children: [
                      const TextSpan(
                        text: 'S',
                        style: TextStyle(
                          fontFamily: FontStyles.CarosSoftBold,
                          fontSize: 33,
                          color: Colors.black, // Customize the color
                        ),
                      ),
                      const TextSpan(
                        text: 'ign',
                        style: TextStyle(
                          fontFamily: FontStyles.CarosSoftBold,
                          fontSize: 25,
                          color: Colors.red, // Customize the color
                        ),
                      ),
                      const TextSpan(
                        text: ' L',
                        style: TextStyle(
                          fontFamily: FontStyles.CarosSoftBold,
                          fontSize:33,
                          color: Colors.black, // Customize the color
                        ),
                      ),
                      TextSpan(
                        text: 'ang',
                        style: TextStyle(
                          fontFamily: FontStyles.CarosSoftBold,
                          fontSize: 20,
                          color: Colors.blue.shade300, // Customize the color
                        ),
                      ),
                      TextSpan(
                        text: 'uage',
                        style: TextStyle(
                          fontFamily: FontStyles.CarosSoftBold,
                          fontSize: 20,
                          color: Colors.blue.shade300, // Customize the color
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 5,),
                Image.asset('assets/signlanguage.png',width: 40,height: 40,)


              ],

            ),
            const SizedBox(height: 30,),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Text To Sign',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontFamily: FontStyles.CarosSoftBold,color: Colors.black,),),
            ),
            const SizedBox(height: 10,),
            
            Center(
              child: Container(
                width: 370,
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
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/text.png',width: 60,height: 60,),
                       const FaIcon(FontAwesomeIcons.arrowRightLong,color: Colors.black,size: 40,),

                        Image.asset('assets/heart3.png',width: 60,height: 60,),

                      ],

                    ),
                    const SizedBox(height: 22,),
                    const Text('Write your word,sentence,phase etc and get to know how it is in sign language',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontFamily: FontStyles.CarosSoftLight,color: Colors.black,),),




                  ],),
                ),
              )


            ),
            const SizedBox(height: 25,),

            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Sign To Text',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontFamily: FontStyles.CarosSoftBold,color: Colors.black,),),
            ),
            const SizedBox(height: 10,),

            Center(
              child: Container(
                width: 370,
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomSheetBarPage(),));


                  },
                  child: Column(children: [
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/heart2.png',width: 60,height: 60,),
                        const FaIcon(FontAwesomeIcons.arrowRightLong,color: Colors.black,size: 40,),

                        Image.asset('assets/text.png',width: 60,height: 60,),

                      ],

                    ),
                    const SizedBox(height: 22,),
                    const Text('Show your sign language and gets \nit text in form of word,sentence,phase etc. ',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontFamily: FontStyles.CarosSoftLight,color: Colors.black,),),




                  ],),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
