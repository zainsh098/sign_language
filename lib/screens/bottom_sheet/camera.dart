import 'package:camera/camera.dart';
import 'package:flutter/material.dart';



class CameraApp1 extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraApp1({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraApp1> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp1> {
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
          child: CameraPreview(_controller),
        ),
      ),
    );
  }
}
