import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// image_picker: ^0.8.4+4
/// path_provider: ^2.0.8
class FileUtils {
  FileUtils._privateConstructor();
  static final FileUtils _instance = FileUtils._privateConstructor();
  static FileUtils get instance => _instance;

  final ImagePicker _picker = ImagePicker();
  late final Directory supportDirectory;
  late final Directory documentDirectory;

  Future<void> initilizeDirectories() async {
    supportDirectory = await getApplicationSupportDirectory();
    documentDirectory = await getApplicationDocumentsDirectory();

    if (kDebugMode) {
      print("Support: $supportDirectory");
      print("Docs: $documentDirectory");
    }
  }

  pickImage(ImageSource source) async {
    XFile? image = await _picker.pickImage(source: source);
    return image;
  }

  pickVideo(ImageSource source) async {
    XFile? video = await _picker.pickVideo(source: source);
    return video;
  }

  pickMultipleVideos(ImageSource source) async {
    List<XFile>? images = await _picker.pickMultiImage();
    return images;
  }
}
