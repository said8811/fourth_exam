import 'package:fifth_exam/data/models/student/student_model.dart';
import 'package:fifth_exam/data/services/uploader/image_upload.dart';
import 'package:fifth_exam/view_models/student_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UpdatePage extends StatefulWidget {
  StudentModel studentModel;
  UpdatePage({super.key, required this.studentModel});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.studentModel.studentName,
              onChanged: (value) {
                widget.studentModel.studentName = value;
              },
              decoration: InputDecoration(
                  hintText: "Name",
                  label: const Text("Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
                onPressed: () {
                  _showPicker(context);
                },
                child: const Text(
                  "Upload Student image",
                  style: TextStyle(fontSize: 24),
                )),
            Image.network(
              widget.studentModel.imageUrl,
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<StudentViewModel>(context, listen: false)
                      .updateStudents(StudentModel(
                          imageUrl: widget.studentModel.imageUrl,
                          studentName: widget.studentModel.studentName,
                          studentId: widget.studentModel.studentId));

                  Navigator.pop(context);
                },
                child: const Text(
                  "Update student",
                  style: TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Gallery"),
                    onTap: () {
                      _getFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _getFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {});
      if (!mounted) return;
      widget.studentModel.imageUrl =
          await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      setState(() {});
    }
  }

  _getFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      widget.studentModel.imageUrl =
          await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      setState(() {});
    }
  }
}
