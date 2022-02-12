import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../size.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    required this.note,
    required this.title,
    required this.ctr,
    this.widg,
  }) : super(key: key);

  final String note;
  final String title;
  final TextEditingController ctr;
  final Widget? widg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: 52,
          padding: const EdgeInsets.only(
            left: 14,
          ),
          margin: const EdgeInsets.only(
            top: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: false,
                  readOnly: widg != null ? true : false,
                  controller: ctr,
                  cursorColor: Colors.grey[700],
                  decoration: InputDecoration(
                    hintText: note,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
              widg == null ? Container() : widg as Widget,
            ],
          ),
        ),
      ]),
    );
  }
}

class Negger extends StatelessWidget {
  Negger({
    Key? key,
    required this.title,
    required this.textEditingController,
  }) : super(key: key);
  final String title;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: 52,
            padding: const EdgeInsets.only(
              left: 14,
            ),
            margin: const EdgeInsets.only(
              top: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    autofocus: false,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                        ),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () async {
                          if (textEditingController.text.toString() == "") {
                            print("null data");
                          } else {
                            print(textEditingController.text.toString());
                            if (await canLaunch("https://" +
                                textEditingController.text.toString())) {
                              await launch("https://" +
                                  textEditingController.text.toString());
                            } else {
                              throw 'Could not launch ${textEditingController.text.toString()}';
                            }
                          }
                        },
                        icon: Icon(Icons.open_in_browser),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
