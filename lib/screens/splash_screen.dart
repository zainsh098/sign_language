import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showScaney = false;
  bool showCaption = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Delay the animation of showing "scaney" by 4 seconds (adjust as needed)
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showScaney = true;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showCaption = true;
      });
    });
    Future.delayed(const Duration(seconds: 7), () {
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
                          0, showScaney ? -height * 0.10 : 0, 0),
                      child: SizedBox(
                        height: height * 0.23,
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
                  opacity: showScaney ? 1.0 : 0.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              isRepeatingAnimation: false,
                              pause: const Duration(milliseconds: 600),
                              animatedTexts: [
                                WavyAnimatedText(
                                  'scaney',
                                  // textStyle: GoogleFonts.roboto(
                                  //   fontSize: 30,
                                  //   color: Colors.blue,
                                  // ),
                                  speed: const Duration(milliseconds: 900),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            AnimatedTextKit(
                              isRepeatingAnimation: false,
                              pause: const Duration(milliseconds: 600),
                              animatedTexts: [
                                WavyAnimatedText(
                                  '.Z',
                                  // textStyle: GoogleFonts.roboto(
                                  //   fontSize: 30,
                                  //   color: Colors.blue,
                                  // ),
                                  speed: const Duration(milliseconds: 2800),
                                ),
                              ],
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
