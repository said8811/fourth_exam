import 'package:fifth_exam/data/models/student/studenmodel.dart';
import 'package:fifth_exam/data/services/uploader/imageUpload.dart';
import 'package:fifth_exam/utils/toast.dart';
import 'package:fifth_exam/view_models/studentViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String imageUrl = '';
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
            TextField(
              controller: nameController,
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
            imageUrl.isEmpty
                ? const SizedBox(height: 2)
                : Image.network(
                    "$imageUrl",
                    height: 100,
                  ),
            ElevatedButton(
                onPressed: () {
                  if (imageUrl.isNotEmpty) {
                    Provider.of<StudentViewModel>(context, listen: false)
                        .addStudent(StudentModel(
                            imageUrl: imageUrl,
                            studentName: nameController.text,
                            studentId: "studentId"));
                    Navigator.pop(context);
                  } else {
                    Mytoast.getMyToast(message: "Rasmni Tanlang");
                  }
                },
                child: const Text(
                  "Add student",
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
      imageUrl = await FileUploader.imageUploader(pickedFile);
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
      imageUrl = await FileUploader.imageUploader(pickedFile);
      if (!mounted) return;
      setState(() {});
    }
  }
}
