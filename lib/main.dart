import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

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
      home: CameraApp(cameras: cameras), // Pass cameras to CameraApp
    );
  }
}
class CameraApp extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraApp({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[_selectedCameraIndex], ResolutionPreset.max);
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      await _controller.initialize();
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      // Handle camera initialization errors here.
      print('Camera initialization error: ${e.description}');
    }
  }

  void _toggleCamera() {
    if (widget.cameras.length < 2) {
      return; // No other camera available
    }
    final newCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
    setState(() {
      _selectedCameraIndex = newCameraIndex;
      _controller = CameraController(widget.cameras[newCameraIndex], ResolutionPreset.max);
      _initializeCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Camera App'),
          actions: [
            IconButton(
              icon: Icon(Icons.switch_camera),
              onPressed: _toggleCamera,
            ),
          ],
        ),
        body: Center(
          child: Container(
              width: 400.0,
              height: 300.0,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(50.0), // Adjust as needed
                boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
          ),

  ],
            ),       child: CameraPreview(_controller)),
        ),
      ),
    );
  }
}
