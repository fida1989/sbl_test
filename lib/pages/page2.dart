import 'package:flutter/material.dart';

class Page2View extends StatelessWidget {
  final String title;

  const Page2View({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go Back"),
          onPressed: () {
            Navigator.of(context).pop("Test Value");
          },
        ),
      ),
    );
  }
}
