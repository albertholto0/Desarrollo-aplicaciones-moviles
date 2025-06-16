import 'package:flutter/material.dart';
import 'dart:io';

class PhotoPicker extends StatefulWidget {
  const PhotoPicker({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PhotoPickerState();
  }
}

class _PhotoPickerState extends State<PhotoPicker> {
  File? _photo;

  void _takePhoto() {}

  @override
  Widget build(BuildContext context) {
    Widget previewPhoto = ElevatedButton.icon(
      onPressed: _takePhoto,
      label: Text("Tomar foto"),
      icon: Icon(Icons.add_a_photo),
    );
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
