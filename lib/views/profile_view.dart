import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final String name;
  final String image;

  const ProfileView({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          image,
          height: 200,
          width: 200,
        ),
        Text(name),
      ],
    );
  }
}
