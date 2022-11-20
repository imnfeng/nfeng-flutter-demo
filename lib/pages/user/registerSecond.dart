import 'package:flutter/material.dart';

class RegisterSecoundPage extends StatefulWidget {
  const RegisterSecoundPage({super.key});

  @override
  State<RegisterSecoundPage> createState() => _RegisterSecoundPageState();
}

class _RegisterSecoundPageState extends State<RegisterSecoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("注册第二步")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("注册第二步"),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/registerThird");
              },
              child: const Text("下一步"),
            )
          ],
        ),
      ),
    );
  }
}
