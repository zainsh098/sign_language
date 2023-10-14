import 'package:bottom_sheet_bar/bottom_sheet_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_language/screens/bottom_sheet/camera.dart';

import '../../font_styles.dart';


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
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: BottomSheetBar(
              velocityMin: 5,




              height: 30,
              backdropColor: Colors.grey.shade50.withOpacity(0.3),

              controller: _bsbController,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              color: Colors.blueAccent.shade100,
              borderRadiusExpanded: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
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

                return GestureDetector(
                  onTap: () {

                    FocusScope.of(context).unfocus();


                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Material(

                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomScrollView(





                          controller: scrollController,
                          shrinkWrap: true,

                          slivers: [

                            SliverToBoxAdapter(



                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,),
                                    child: Text('Translated Text ',textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15,fontFamily: FontStyles.CarosSoftMedium,color: Colors.black,),),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
                                    child: TextField(
                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      maxLines: 1, // Allows for multiline input
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            borderSide:
                                            BorderSide(color: Colors.blue.shade200,width: 2)),
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.greenAccent),
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(        style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(
                                            Colors.blue.shade300,),
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
                                            Colors.blue.shade300,),
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
                                  SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 10,),
                                    child: Text('Predicted Text will display here  ',textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15,fontFamily: FontStyles.CarosSoftMedium,color: Colors.black,),),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 15),
                                    child: TextField(
                                      maxLines: 1, // Allows for multiline input
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            borderSide:
                                               BorderSide(color: Colors.blue.shade200,width: 2)),
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
                      ),
                    ),
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
            ),


  );
}
