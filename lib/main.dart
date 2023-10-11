import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sign_language/screens/bottom_sheet/bottom_sheet.dart';
import 'package:sign_language/screens/bottom_sheet/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras)); // Pass cameras to MyApp
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras; // Define cameras as an argument

  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sign',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),

        useMaterial3: true,
      ),
      home: BottomSheetBarPage(cameras: cameras,), // Pass cameras to CameraApp
    );
  }
}
