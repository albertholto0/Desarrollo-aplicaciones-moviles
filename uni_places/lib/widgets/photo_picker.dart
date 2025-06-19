import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhotoPicker extends StatefulWidget {
  const PhotoPicker({super.key, required this.onPickedPhoto});

  final void Function(File photo) onPickedPhoto;

  @override
  State<StatefulWidget> createState() {
    return _PhotoPickerState();
  }
}

class _PhotoPickerState extends State<PhotoPicker> {
  File? _photo;

  Future<void> _takePhoto() async {
    final imagePicker = ImagePicker();
    final pickedPhoto = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedPhoto != null) {
      setState(() {
        _photo = File(pickedPhoto.path);
      });
      widget.onPickedPhoto(_photo!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget previewPhoto = ElevatedButton.icon(
      onPressed: _takePhoto,
      label: Text("Tomar foto"),
      icon: Icon(Icons.add_a_photo),
    );
    if (_photo != null) {
      previewPhoto = GestureDetector(
        onTap: _takePhoto,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Image.file(
            _photo!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 300,
      alignment: Alignment.center,
      child: previewPhoto,
    );
  }
}
