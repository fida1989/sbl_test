import 'package:flutter/material.dart';

class Tab1View extends StatefulWidget {
  final BuildContext con;
  final VoidCallback onCLick;

  const Tab1View({Key? key, required this.con, required this.onCLick})
      : super(key: key);

  @override
  State<Tab1View> createState() => _Tab1ViewState();
}

class _Tab1ViewState extends State<Tab1View> {
  String? _value;

  @override
  void initState() {
    super.initState();
    setValue();
  }

  void setValue() async {
    _value = await getText();
    setState(() {});
  }

  Future<String> getText() async {
    debugPrint("wait start");
    await Future.delayed(Duration(seconds: 3), () {
      debugPrint("wait done");
    });
    return "New Value";
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(_value ?? "Loading..."));
  }
}
