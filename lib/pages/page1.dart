import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page2.dart';

class Page1View extends StatefulWidget {
  final String title;

  const Page1View({Key? key, required this.title}) : super(key: key);

  @override
  State<Page1View> createState() => _Page1ViewState();
}

class _Page1ViewState extends State<Page1View> {
  String _myValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text("2nd Page"),
            onPressed: () async {


              final SharedPreferences prefs =
              await SharedPreferences.getInstance();
              await prefs.setString("my_value", _myValue);



              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Page2View(
                          title: "Page 2",
                        )),
              );
            },
          ),
          SizedBox(
            width: 250,
            child: TextField(
              onChanged: (value) {
                _myValue = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
