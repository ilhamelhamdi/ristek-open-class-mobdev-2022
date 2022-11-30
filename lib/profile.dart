import 'package:flutter/material.dart';
import 'package:ristek_op_mobdev/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(40)),
                color: Color(primaryColor['purple'])),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileData['img']),
                    radius: 80,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    profileData['name'],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "NPM ${profileData['npm']}",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  )
                ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            DataField(field: 'Bio'),
            DataField(field: "Motivation"),
          ])
        ],
      ),
    );
  }
}

class DataField extends StatelessWidget {
  const DataField({Key? key, required this.field}) : super(key: key);

  final String field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Color(primaryColor['yellow']),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 40,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(color: Color(primaryColor['purple'])),
              ),
              Expanded(
                  child: Text(
                field,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(profileData[field.toLowerCase()],
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
