import 'dart:convert';
// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspiro Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Inspiro On-the-go'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      'https://avatars2.githubusercontent.com/u/9157083?s=460&u=502a25185bae5e5ebf350855056b37a0a53eebec&v=4';
  Map dockerData;

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> setJsonData(url) async {
    var jsonData = await http.get(url);
    var returnValue;
    if (jsonData.statusCode == 200) {
      returnValue = jsonDecode(jsonData.body);
    } else {
      print('A network error occurred');
    }
    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    void _updateMotivationalImage() async {
      print('Clicking the image update');
      var dockerHolder = await setJsonData(
          "http://xxx.xxx.xxx.xxx:8080"); //This would usually be a DNS record and not a hardcoded IP

      setState(() {
        dockerData = dockerHolder;
        print(dockerData['quote_url']);
        imageUrl = dockerData['quote_url'];
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              imageUrl,
            ),
            Text(
              'Get Motivated',
              style: TextStyle(color: Colors.blue),
            ),
            FlatButton(
              onPressed: _updateMotivationalImage,
              color: Colors.blue,
              child: Icon(Icons.lightbulb),
              minWidth: 300.0,
            )
          ],
        ),
      ),
    );
  }
}
