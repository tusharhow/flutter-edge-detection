import 'package:edge_detection/edge_detection.dart';
import 'package:get/get.dart';

class EdgeDetectionController extends GetxController {
  String? imagePath;

  void detectObject() async {
    imagePath = await EdgeDetection.detectEdge;
    update();
  }
}
