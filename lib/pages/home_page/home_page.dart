import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sbl_test/models/person.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //debugPrint("main rebuild");
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
          ? Column(
              children: [
                ProfileView(image: _image, name: _name),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Age'),
                  ),
                ),
                ElevatedButton(
                  child: Text("Save Data"),
                  onPressed: () async {
                    //var box = await Hive.openBox('cache_box');
                    //box.put('name', _nameController.text);
                    //box.put('age', _ageController.text);
                    var box = await Hive.openBox('person_box');
                    Person person = Person();
                    person.name = _nameController.text;
                    person.age = int.parse(_ageController.text);
                    box.add(person);
                    print("data saved!");
                  },
                ),
                ElevatedButton(
                  child: Text("Get Data"),
                  onPressed: () async {
                    //var box = await Hive.openBox('cache_box');
                    //print('Name: ${box.get('name')}');
                    //print('Age: ${box.get('age')}');
                    Box box = await Hive.openBox('person_box');
                    for (var element in box.values) {
                      print(element.name + " " + element.age.toString());
                    }
                  },
                ),
              ],
            )
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
    setState(() {});
  }
}
