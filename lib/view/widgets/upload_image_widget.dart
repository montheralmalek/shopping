import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart%20';
import 'package:image_picker/image_picker.dart';
import 'package:shopping/controllers/cart_controller.dart';

class UploadImageWidget extends GetView<CartControllerImp> {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          controller.image == null
              ? const Text('No image selected.')
              : SizedBox(
                  height: 300,
                  width: 350,
                  child: Image.file(controller.image!)),
          const Gap(20),
          ElevatedButton.icon(
            onPressed: () => controller.pickImage(ImageSource.camera),
            label: const Text('Pick Image from Camera'),
            icon: const Icon(Icons.file_upload_outlined),
          ),
          ElevatedButton.icon(
            onPressed: () => controller.pickImage(ImageSource.gallery),
            label: const Text('Pick Image from Gallery'),
            icon: const Icon(Icons.camera_alt_outlined),
          ),
        ],
      );
    });
  }
}
