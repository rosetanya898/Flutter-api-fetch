import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/bookdetail.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  String url = "https://www.googleapis.com/books/v1/volumes?q=%22c++%22&maxResult=1:keyes&key=AIzaSyCqOTAyAN9dJF5WUqFJk-pzQPU9IdO6aaM";
 List data = [];  String topic='';  String write1='';  String write2='';
 Future<dynamic> makereq() async {
   http.Response response = await http.get(Uri.parse(url), headers: {'Accept': 'application/json'});
   
   setState(() {
      var extract = json.decode(response.body);
     data = extract['items'];
   });
   print(topic);
   print(write1);
   print(write2);
 }

 @override
 void initState(){
   super.initState();
   makereq();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: data.length,
       itemBuilder: (BuildContext context, i){
         return ListTile(
           title: Text(data[i]['volumeInfo']['title']),
           subtitle: Text(data[i]['volumeInfo']['authors'][0]),
           onTap: (){Navigator.push(context,
           MaterialPageRoute(builder: (context) => BookDetail(data: data[i])));},
         );
       }),
    );
  }

}