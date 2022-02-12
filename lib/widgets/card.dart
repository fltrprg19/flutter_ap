import 'package:flutter/material.dart';

import '../constants.dart';
import 'like.dart';

class ShoeCard extends StatelessWidget {
  final shoe;
  final nice;
  final user;
  final image;

  const ShoeCard(
      {Key? key,
      this.image = 'assets/images/person.jpeg',
      required this.nice,
      required this.shoe,
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 23),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor,
        ),
        height: 176,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  likeButton(),
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Image.asset(image),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: shoe.toString(),
                      style: Theme.of(context).textTheme.headline4,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nمن $user',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    nice.toString(),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
