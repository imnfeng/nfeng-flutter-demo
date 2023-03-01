import 'package:flutter/material.dart';

class TabDevicePage extends StatefulWidget {
  const TabDevicePage({super.key});

  @override
  State<TabDevicePage> createState() => _TabDevicePageState();
}

class _TabDevicePageState extends State<TabDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/device");
                },
                child: const Text("Device设备插件"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/network");
                },
                child: const Text("检测网络变化"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/urlLauncher");
                },
                child: const Text("urlLauncher"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/video");
                },
                child: const Text("video播放视频"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/chewieVideo");
                },
                child: const Text("chewie播放视频"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
