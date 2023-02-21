import 'package:denote/constants/constants.dart';
import 'package:denote/homepages/first_page/widgets/doc_item.dart';
import 'package:denote/homepages/homepage/homepage.dart';
import 'package:denote/main.dart';
import 'package:denote/widgets/custom_textfield.dart';
import 'package:denote/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../firebase_service/storage_service.dart';

class AddUnit extends StatefulWidget {
  final Map<String, String>? userData;
  const AddUnit({super.key, required this.userData});

  @override
  State<AddUnit> createState() => _AddUnitState();
}

class _AddUnitState extends State<AddUnit> {
  final unitNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  PlatformFile? pickedFile;

  bool isFilePicked = false;

  String? course = "";
  String? semester = "";

  @override
  void initState() {
    super.initState();
    setUploadInfo();
  }

  //load admin's course and semester to get the firebase storage path
  void setUploadInfo() async {
    final loadedCourse = widget.userData?["course"];
    final loadedSemester = widget.userData?["semester"];
    setState(() {
      course = loadedCourse;
      semester = loadedSemester;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        elevation: 0,
        title: const Text("Add unit"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    controller: unitNameController,
                    hidePassword: false,
                    icon: Icons.text_format,
                    hintText: "Unit Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the unit name first";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kMainDarkColor),
                    onPressed: () async {
                      //Check if course name is empty
                      if (_formKey.currentState!.validate()) {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowMultiple: false,
                          allowedExtensions: ['pdf'],
                        );
                        if (result == null) {
                          messengerKey.currentState!.showSnackBar(
                            const SnackBar(
                              content: Text("No file picked"),
                            ),
                          );
                          return;
                        }
                        //set picked file to result
                        setState(() {
                          pickedFile = result.files.single;
                          isFilePicked = true;
                        });
                      }
                    },
                    child: const Text("Select files"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isFilePicked == true
                      ? Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                          ),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              DocItem(
                                //TODO : Doc is untyped here
                                doc: null,
                                docName: pickedFile?.name,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(
                          height: 20,
                        ),
                  const SizedBox(
                    height: 40,
                  ),
                  isFilePicked == true
                      ? GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                            Fbstorage.uploadFile(
                              unitName: unitNameController.text.trim(),
                              course: course,
                              semester: semester,
                              pickedFile: pickedFile,
                            ).then((value) {
                              messengerKey.currentState!.showSnackBar(
                                SnackBar(
                                  content: Text("Uploaded ${pickedFile?.name}"),
                                  backgroundColor: Colors.blue,
                                ),
                              );

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                              Navigator.pop(context); //TODO: Add pop route
                            });
                          },
                          child: const SubmitButton(buttonText: "Add unit"),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
