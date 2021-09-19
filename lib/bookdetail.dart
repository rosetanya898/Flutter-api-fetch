import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final data;
  const BookDetail({ Key? key, required this.data}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data['volumeInfo']['title']),),
      body: Container(
        child:  Column(
          children:[ Text(data['volumeInfo']['description']),
          ]
        ),
      ),
    );
  }
}