import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  AppImagePicker() {
    picker = ImagePicker();
  }
  ImagePicker? picker;
  XFile? image;
  Future<XFile?> pickFromGallery() async {
    if (picker == null) return null;
    image = await picker?.pickImage(source: ImageSource.gallery);
    return image;
  }
}
