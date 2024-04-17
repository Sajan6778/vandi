import 'package:flutter/material.dart';
import 'package:image_field/image_field.dart';
import 'package:image_field/linear_progress_indicator_if.dart';

class Uploadings extends StatefulWidget {
  final List upload_page;
  final PageController upload_controller;
  const Uploadings(
      {super.key, required this.upload_controller, required this.upload_page});

  @override
  State<Uploadings> createState() => _UploadingsState();
}

class _UploadingsState extends State<Uploadings> {
  dynamic remoteFiles;

  @override
  Widget build(BuildContext context) {
    PageController controller = widget.upload_controller;

    List worker_page = widget.upload_page;

    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      height: 200,
      child: 
    
    
    Container(
       height: mediaQueryData.size.height / 2,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: 'Enter you name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(
            height: 50,
          ),
          ImageField(
              files: remoteFiles != null
                  ? remoteFiles!.map((image) {
                      return ImageAndCaptionModel(
                          file: image, caption: image.alt.toString());
                    }).toList()
                  : [],
              remoteImage: true,
              onUpload: (pickedFile,
                  ControllerLinearProgressIndicatorIF?
                      controllerLinearProgressIndicator) async {
                dynamic fileUploaded = await (
                  pickedFile,
                  uploadProgress: (percent) {
                    var uploadProgressPercentage = percent / 100;
                    controllerLinearProgressIndicator!
                        .updateProgress(uploadProgressPercentage);
                  },
                );
                return fileUploaded;
              },
              onSave: (List<ImageAndCaptionModel>? imageAndCaptionList) {
                remoteFiles = imageAndCaptionList;
              }),
          SizedBox(
            height: 50,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          )),
        ],
      ),
     ) );
  }
}
