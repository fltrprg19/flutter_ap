import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/card.dart';


class Stream extends StatefulWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  State<Stream> createState() => _StreamState();
}

class _StreamState extends State<Stream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('send')
          .orderBy(
            'createdat',
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        final docs = snapshot.data!.docs;
        final user = FirebaseAuth.instance.currentUser;

        return Expanded(
          child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                
                return ShoeCard(
                    nice: docs[index]['text'],
                    shoe: docs[index]['text1'],
                    user: "user");
              }),
        );
      },
    );
  }

  
}
