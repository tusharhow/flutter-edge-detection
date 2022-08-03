import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_edge_detection/controllers/edge_detection_controller.dart';
import 'package:get/get.dart';

class DetectObjectScreen extends StatelessWidget {
  const DetectObjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detect Object'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<EdgeDetectionController>(
            init: EdgeDetectionController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.detectObject,
                      child: const Text('Scan Object'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Cropped image path:',
                      style: TextStyle(fontSize: 20)),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                    child: Text(
                      controller.imagePath ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Visibility(
                    visible: controller.imagePath != null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        File(controller.imagePath ?? ''),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
