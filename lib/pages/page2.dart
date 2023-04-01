import 'package:flutter/material.dart';
import 'package:sbl_test/pages/page3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page2View extends StatefulWidget {
  final String title;

  const Page2View({Key? key, required this.title}) : super(key: key);

  @override
  State<Page2View> createState() => _Page2ViewState();
}

class _Page2ViewState extends State<Page2View> {

  String _myValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _myValue = prefs.getString("my_value")!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("3rd Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page3View(title: "Page 3")),
                );
              },
            ),
            Text(_myValue),
          ],
        ),
      ),
    );
  }
}
