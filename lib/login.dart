import 'package:flutter/material.dart';
import 'package:ristek_op_mobdev/constants.dart';
import 'package:ristek_op_mobdev/profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  void onLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged in successfully.')));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(40)),
                  color: Color(primaryColor['purple'])),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    "Ristek",
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: InputGroup(
                    value: _username,
                    field: 'username',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: InputGroup(
                    value: _password,
                    field: 'password',
                    isObscured: true,
                  ),
                ),
              ]),
            ),
            ElevatedButton(
                onPressed: onLogin,
                style: ElevatedButton.styleFrom(
                  primary: Color(primaryColor['purple']),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}

class InputGroup extends StatelessWidget {
  const InputGroup(
      {Key? key,
      required this.value,
      required this.field,
      this.isObscured = false})
      : super(key: key);

  final TextEditingController value;
  final String field;
  final bool isObscured;

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Must not be empty.';
    }
    if (value != validInput[field]) {
      return 'Invalid input.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Text(
            field.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: value,
          validator: validateInput,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 20)),
          obscureText: isObscured,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
