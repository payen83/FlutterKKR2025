import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Camera'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: imageFile != null
            ? Image.file(imageFile!, fit: BoxFit.cover)
            : Image.asset('assets/images/onbording-image.png', fit: BoxFit.cover)
          ),
          ElevatedButton(
            onPressed: () async{
              final ImagePicker picker = ImagePicker();
              final XFile? camera = await picker.pickImage(source: ImageSource.camera);
              if (camera !=null){
                setState(() {
                  imageFile = File(camera.path);
                });
              }
            }, 
            child: Text('Take Picture')
          )
        ],
      ),
    );
  }
}