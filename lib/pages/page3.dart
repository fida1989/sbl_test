import 'package:flutter/material.dart';
import 'package:sbl_test/pages/page1.dart';

class Page3View extends StatelessWidget {
  final String title;

  const Page3View({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Go Back"),
              onPressed: () {
                Navigator.of(context).pop("Test Value");
              },
            ),
            ElevatedButton(
              child: Text("Pop Until 1st Page"),
              onPressed: () {
                /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (context) => Page1View(title: "Page 1")), (Route route) => false);*/
                Navigator.popUntil(context, ModalRoute.withName('/page1'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
