import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraDescription _firstCamera;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  var _isControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (_isControllerInitialized) {
      return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            var camera = _controller.value;
            final size = MediaQuery.of(context).size;
            var scale = size.aspectRatio * camera.aspectRatio;
            if (scale < 1) scale = 1 / scale;
            return Transform.scale(
              scale: scale,
              child: Center(
                child: CameraPreview(_controller),
              ),
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initCamera() async {
    final cameras = await availableCameras();
    _firstCamera = cameras.first;
    _controller = CameraController(_firstCamera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
    setState(() {
      _isControllerInitialized = true;
    });
  }
}
