import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size.dart';

class FormErorr extends StatelessWidget {
  const FormErorr({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formerror(errors: errors[index])));
  }

  Row formerror({String? errors}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(errors!),
      ],
    );
  }
}
