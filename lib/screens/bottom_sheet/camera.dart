import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../font_styles.dart';



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
    _controller = CameraController(widget.cameras[_selectedCameraIndex], ResolutionPreset.ultraHigh,imageFormatGroup: ImageFormatGroup.jpeg);
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
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    if (!_controller.value.isInitialized) {
      return Container();
    }

    return  Scaffold(
      backgroundColor: Colors.grey.shade50,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [



            Padding(
              padding: const EdgeInsets.only(bottom: 170),
              child: Center(
                child: Container(
                  width: width * 0.97,
                  height: height * 0.54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Adjust as needed
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // Adjust as needed
                    child: CameraPreview(_controller),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  }
}
