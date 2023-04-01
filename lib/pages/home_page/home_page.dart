import 'package:flutter/material.dart';
import 'package:sbl_test/models/profile_response.dart';
import 'package:sbl_test/pages/home_page/home_interface.dart';
import 'package:sbl_test/pages/page1.dart';
import 'package:sbl_test/views/profile_view.dart';

import 'home_presenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeInterface {
  String title = "hello";
  HomePresenter? _presenter;
  String _image = "";
  String _name = "";
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    debugPrint("main rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                //_presenter?.getProfile(_loading);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: RouteSettings(name: "/page1"),
                    builder: (context) => Page1View(title: "Page 1"),
                  ),
                );
              },
              icon: const Icon(Icons.navigate_next))
        ],
      ),
      body: !_loading
          ? ProfileView(image: _image, name: _name)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    _presenter = HomePresenter(this);
    _presenter?.getProfile(_loading);
  }

  @override
  void onDataLoadError(String error) {
    debugPrint(error);
  }

  @override
  void onDataLoadSuccess(ProfileResponse response) {
    _image = response.data!.avatar!;
    _name = "${response.data!.firstName!} ${response.data!.lastName!}";
    _loading = false;
    setState(() {});
  }

  @override
  void onLoadingStart() {
    _loading = true;
    setState(() {

    });
  }
}
