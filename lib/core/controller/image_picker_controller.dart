


import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{
  
   File? image;

  Future pickImageFromCam() async {
    try {
    final  imagefromCamera =
         await ImagePicker().pickImage(source: ImageSource.camera);

    final imageTemproray =  File(imagefromCamera!.path);
      
        image = imageTemproray;
     update();

    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  Future pickImageFromGallrey() async {
    
    try {
      final   imagefromGallery =
         await ImagePicker().pickImage(source: ImageSource.gallery);

      

      final imageTemproray =  File(imagefromGallery!.path);
      
        image = imageTemproray;
     update();
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }



}