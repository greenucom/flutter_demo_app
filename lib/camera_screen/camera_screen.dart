import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: const [
              Text("Camera screen")
            ],
          ),
        ),
      ),
    );
  }
}
