import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class profilpor extends StatefulWidget {
  static var foto = null;
  const profilpor({
    Key? key,
  }) : super(key: key);

  @override
  State<profilpor> createState() => _profilporState();
}

class _profilporState extends State<profilpor> {
  final ImagePicker picker = ImagePicker();
  void pickimage(ImageSource src) async {
    final pickedinagefileaait = await picker.getImage(source: src);
    if (pickedinagefileaait != null) {
      setState(() {
        profilpor.foto = File(pickedinagefileaait.path);
      });
    } else {
      print("No Inage Selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              profilpor.foto == null
                  ? "assets/images/person.jpeg"
                  : profilpor.foto,
            ),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: SizedBox(
              width: 46,
              height: 46,
              child: Row(
                children: [
                  FlatButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    color: Color(
                      0xFFF5F6F9,
                    ),
                    onPressed: () => pickimage(
                      ImageSource.camera,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Camera Icon.svg",
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    color: Color(
                      0xFFF5F6F9,
                    ),
                    onPressed: () => pickimage(
                      ImageSource.gallery,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Camera Icon.svg",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
