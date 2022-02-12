import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/db/storage.dart';
import 'package:flutter_app1/db/stream.dart';
import 'package:flutter_app1/widgets/button.dart';
import 'package:flutter_app1/widgets/input_field.dart';
import 'package:flutter_app1/widgets/theme.dart';

import 'package:path/path.dart';
import '../constants.dart';
import 'notif.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);
  static String routname = '/add-task';

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  DateTime selectedDate = DateTime.now();
  TextEditingController noteController = TextEditingController();
  TextEditingController link = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController path = TextEditingController();
  UploadTask? task;
  File? file;
  var mshrf = false;
  var m7asb = false;
  var syanh = false;

  var geturl;

  @override
  Widget build(BuildContext context) {
    final filename = file != null ? basename(file!.path) : 'لم يتم تحديد ملف';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Sui.routname);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "اضف رسالة",
                style: head0,
              ),
              InputField(
                note: "ادخل عنوان",
                title: "عنوان",
                ctr: titleController,
              ),
              InputField(
                note: "الملاحظة",
                title: "ادخل الملاحظة",
                ctr: noteController,
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Expanded(
                    child: RoundedLoadingButton(
                      controller: _btnController1,
                      successIcon: Icons.check_circle_outline_rounded,
                      failedIcon: Icons.cottage,
                      onPressed: () {
                        selectFile(_btnController1, context);
                      },
                      successColor: Colors.green[700],
                      color: kPrimaryColor,
                      child: Text('''
حدد ملف''', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                onPressed: () {
                  _btnController1.reset();
                },
                child: Text("تغيير الصورة"),
              ),
              Text(
                filename,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Negger(
                title: "رابط (اختياري)",
                textEditingController: link,
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: mshrf,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          setState(() {
                            mshrf = value!;
                          });
                        },
                      ),
                      Text("الارسال للمشرف العام"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: syanh,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          setState(() {
                            syanh = value!;
                          });
                        },
                      ),
                      Text('ارسال الى عامل الصيانه'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: m7asb,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          setState(() {
                            m7asb = value!;
                          });
                        },
                      ),
                      Text('ارسال للمحاسب')
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              MyButton(
                  lable: 'ارسال الرسالة',
                  onTap: () async {
                    if (m7asb == false && mshrf == false && syanh == false) {
                      return _showerrordilog(
                          'يجب اختيار من سترسل اليه الرسالة', context);
                    }
                    if (titleController.text.isEmpty ||
                        noteController.text.isEmpty) {
                      return _showerrordilog(
                          'يبدوا انه هناك حقل فارغ', context);
                    } else {
                      try {
                        final _firestore = FirebaseFirestore.instance;
                        final user = FirebaseAuth.instance.currentUser;
                        final userdata = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user!.uid)
                            .get();
                        return _firestore
                            .collection('send')
                            .add({
                              'text': noteController.text,
                              'text1': titleController.text,
                              'createdat': Timestamp.now(),
                              'user': user.uid,
                              'whosend1': mshrf == false
                                  ? null
                                  : 's2TBcnD9p7RiSrWc0qQ1DQVKMkJ2',
                              'whosend2': m7asb == false
                                  ? null
                                  : 'ufVQ0fTpGEMNVpa3Ru4FOmiYh1e2',
                              'whosend3': syanh == false
                                  ? null
                                  : '020BUDLh91apOQG0dYOw4OCIEMY2',
                            })
                            .then(
                              (_) => Stream(),
                            )
                            .then(
                              (_) => Navigator.of(context).pushReplacementNamed(
                                Sui.routname,
                              ),
                            );
                      } catch (e) {
                        print(e);
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile(
      RoundedLoadingButtonController controller, BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      return;
    }
    final path = result.files.single.path!;

    setState(() => file = File(path));
    if (file == null) return _showerrordilog('', context);

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    geturl = urlDownload;

    print('Download-Link: $urlDownload');
    Timer(
      Duration(seconds: 3),
      () {
        controller.success();
      },
    );
  }

  _showerrordilog(String error, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('يبدو ان هناك حقل فارغ'),
        content: Text(error),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("حسنا !")),
        ],
      ),
    );
  }
}
