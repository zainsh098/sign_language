import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sign_language/font_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showtitle = false;
  bool showCaption = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Delay the animation of showing "scaney" by 4 seconds (adjust as needed)
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showtitle = true;
      });
    });

    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen(),));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade700,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      transform: Matrix4.translationValues(
                          0, showtitle ? -height * 0.10 : 0, 0),
                      child: SizedBox(
                        height: height * 0.25,
                        width: width * 0.85,
                        child: Lottie.asset(
                          'assets/sign.json',
                          reverse: true,
                          repeat: false,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: showtitle ? 1.0 : 0.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TyperAnimatedText(
                                  'Gesture Talk',
                                  textStyle: TextStyle(
                                    fontFamily: FontStyles.CarosSoftBold,
                                    color: Colors.white,
                                    fontSize: 30

                                  ),speed: Duration(milliseconds: 600)

                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
