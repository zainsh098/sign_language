import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language/screens/bottom_sheet/camera.dart';

import '../../font_styles.dart';
import '../constants.dart';

class BottomSheetBarPage extends StatefulWidget {
  final String title;
  final List<CameraDescription> cameras;

  const BottomSheetBarPage({Key? key, this.title = '',required this.cameras}) : super(key: key);

  @override
  BottomSheetBarPageState createState() => BottomSheetBarPageState();
}

class BottomSheetBarPageState extends State<BottomSheetBarPage> {
  final _bsbController = BottomSheetBarController();


  List<CameraDescription>? _availableCameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _availableCameras = await availableCameras();
  }




  @override
  Widget build(BuildContext context) => Scaffold(

        body: SafeArea(
          child: BottomSheetBar(
            backdropColor: Colors.grey.shade50.withOpacity(0.4),

            controller: _bsbController,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
            color: Colors.blueAccent.shade100,
            borderRadiusExpanded: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5.0,
                blurRadius: 32.0,
                offset: const Offset(0, 0),
              ),
            ],
            expandedBuilder: (scrollController) {
              return Material(
                color: Colors.blue.shade200,
                child: CustomScrollView(
                  controller: scrollController,
                  shrinkWrap: true,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              maxLines: 1, // Allows for multiline input
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Colors.blueGrey.shade200)),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(        style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Colors.blueAccent.shade100,),
                                  minimumSize: MaterialStatePropertyAll(
                                    Size(180, 40),
                                  ),
                                  maximumSize:  MaterialStatePropertyAll(Size(180,40),)
                              ),
                                onPressed: () {
                                  // Handle button 1 click
                                },
                                child: const Text('Speech',style:  TextStyle(
                                  fontFamily: FontStyles.CarosSoftBold,
                                  fontSize: 16,
                                  color: Colors.white, // Customize the color
                                ),),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Colors.blueAccent.shade100,),
                                  minimumSize: MaterialStatePropertyAll(
                                    Size(180, 40),
                                  ),
                                  maximumSize:  MaterialStatePropertyAll(Size(180,40),)
                                ),
                                onPressed: () {
                                  // Handle button 2 click
                                },
                                child: const Text('Translation',style:  TextStyle(
                                  fontFamily: FontStyles.CarosSoftBold,
                                  fontSize: 16,
                                  color: Colors.white, // Customize the color
                                ),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: TextField(
                              maxLines: 1, // Allows for multiline input
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                       BorderSide(color: Colors.blueGrey.shade200)),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            collapsed: TextButton(
              onPressed: () => _bsbController.expand(),
              child: const Icon(FontAwesomeIcons.upLong,color: Colors.black,size: 26,)
            ),
            body: _availableCameras != null
                ? CameraApp1(cameras: _availableCameras!)
                : Center(child: CircularProgressIndicator()),
              ),
            ),


  );
}
