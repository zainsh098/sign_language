import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:sign_language/screens/home_screen.dart';

import '../font_styles.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final Color kDarkBlueColor = const Color(0xFF053149);



  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Register',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Colors.blueAccent.shade100
      ),

      skipTextButton: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          'Skip',
          style: TextStyle(
            fontSize: 18,
            color: kDarkBlueColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),


      controllerColor: Colors.blue.shade200,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset(
            'assets/txtza.png',
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset(
            'assets/signtext1.png',
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/speechtext.png',
            height: 230,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 380,
              ),
              Text(
                'Text To Sign',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26,fontFamily: FontStyles.CarosSoftBold,color: Colors.black,),),


              SizedBox(
                height: 20,
              ),
              Text(
                'Make every word count! Transform your texts into expressive sign language in seconds.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,fontFamily: FontStyles.CarosSoftLight,color: Colors.black,),),

            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 380,
              ),
              Text(
                'Sign To Text',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26,fontFamily: FontStyles.CarosSoftBold,color: Colors.black,),),


              SizedBox(
                height: 20,
              ),
              Text(
                'Unlock words with your hands. Sign to Text,where gestures become language.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,fontFamily: FontStyles.CarosSoftLight,color: Colors.black,),),

            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 350,
              ),
              Text(
                ' Text To Speech & Translation',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26,fontFamily: FontStyles.CarosSoftBold,color: Colors.black,),),

              SizedBox(
                height: 20,
              ),
              Text(
                'Bridge the communication gap easily with our Text-to-Speech.\nSign and speak with ease.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,fontFamily: FontStyles.CarosSoftLight,color: Colors.black,),),

            ],
          ),
        ),
      ],
    );
  }
}
