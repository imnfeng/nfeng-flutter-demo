import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: 0.56,
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: 0.86,
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: 0.86,
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            SizedBox(height: 20),
            CupertinoActivityIndicator(),
            SizedBox(height: 20),
            CupertinoActivityIndicator(radius: 20),
          ],
        ),
      ),
    );
  }
}
