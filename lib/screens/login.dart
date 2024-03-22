import 'package:flutter/material.dart';
import 'package:kuis/screens/home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String? emailError;
  String? passError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              onChanged: (value) {
                setState(() {
                  emailError = null;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                labelText: "Email",
                errorText: emailError,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passController,
              onChanged: (value) {
                setState(() {
                  passError = null;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                labelText: "Password",
                errorText: passError,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String pass = passController.text;

                  if (email != "123210013@faisal.com") {
                    setState(() {
                      emailError = "Invalid email";
                    });
                  } else if (pass != "123210013") {
                    setState(() {
                      passError = "Invalid password";
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }
                },
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
