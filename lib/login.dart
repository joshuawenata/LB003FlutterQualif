import 'package:flutter/material.dart';
import 'package:lb003qualif/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confpasswordController = TextEditingController();

  void handleLogin(){
    String username = usernameController.text;
    String password = passwordController.text;
    String confpassword = confpasswordController.text;

    if(username.length<5){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Username must be 5 letters or more"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );
      return;
    }

    if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username)){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Username can't contain special character"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );
      return;
    }

    if(password.length<5){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Password must be 5 letters or more"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );
      return;
    }

    if(confpassword.length<5){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Confirm Password must be 5 letters or more"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );
      return;
    }

    if(password!=confpassword){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Password and Confirm Password must match!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );
      return;
    }

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return HomePage(username: username);
      },), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.amber[400],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('assets/logo.png'),
            const Text("Welcome, Simsung ready to help you!", style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700, fontSize: 20)),
            Padding(padding: const EdgeInsets.only(top: 20.0), child: TextField(style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700), controller: usernameController, decoration: const InputDecoration(hintText: "Username"))),
            TextField(style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700), obscureText: true, controller: passwordController, decoration: const InputDecoration(hintText: "Password"),),
            TextField(style: const TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w700), obscureText: true, controller: confpasswordController, decoration: const InputDecoration(hintText: "Confirm Password"),),
            Padding(padding: const EdgeInsets.only(top: 20.0), child: Container(width: 200, child: ElevatedButton(
              style : ElevatedButton.styleFrom(backgroundColor: Colors.amber[400]),
              onPressed: () {
                handleLogin();
              },
              child: const Text("Login", style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w900))
            )))
          ],
        )
      ) 
    );
  }
}