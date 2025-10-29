import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  ImagePicker? picker;
  XFile? image;
  AppImagePicker() {
    picker = ImagePicker();
  }
  Future<XFile?> pickFromGallery() async {
    if (picker == null) return null;
    image = await picker?.pickImage(source: ImageSource.gallery);
    return image;
  }
}
