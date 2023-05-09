import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

bool isPrime(int n) {
  if (n < 2) {
    return false;
  }

  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  String textNumber = "Hien thi";
  void changeText(n) {
    setState(() {
      textNumber = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'menu',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a menu')));
            },
          ),
          backgroundColor: Colors.blue,
          title: const Text("My App"),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              TextField(
                controller: textController,
                obscureText: false,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                ),
              ),

              // TextButton
              TextButton(
                onPressed: () {
                  // Respond to button press
                  print("hehe");
                },
                child: Text("Button Text"),
              ),
              // ElevatedButton
              ElevatedButton(
                onPressed: () {
                  if (textController.text == "") {
                    print("error");
                    return;
                  }
                  int number = int.parse(textController.text);
                  String showText = "";
                  print("Prime Number: $number");

                  if (isPrime(number)) {
                    showText = "Prime Number: $number";
                    changeText(showText);
                  } else {
                    showText = "No Prime Number: $number";
                    changeText(showText);
                  }

                  // Respond to button press
                },
                child: Text("Check number"),
              ),

              // OutlinedButton
              OutlinedButton(
                onPressed: () {
                  // Respond to button press
                },
                child: Text(" OutlinedButton"),
              ),
              Text(
                textNumber,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyMaterialApp(
      title: "My App",
      home: MyHomePage(),
    );
  }
}

class MyMaterialApp extends MaterialApp {
   MyMaterialApp({
    Key? key,
     String title ="",
    required Widget home,
  }) : super(
    key: key,
    title: title,
    home: home,
    debugShowCheckedModeBanner: false,
  );

  @override
  bool get debugShowCheckedModeBanner => false;
}
