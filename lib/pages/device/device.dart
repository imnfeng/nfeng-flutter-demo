import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  late List<Widget> _list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDeviceInfo();
  }

  _getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;

    var tempList = allInfo.entries.map((e) {
      return ListTile(
        title: Text("${e.key}:${e.value}"),
      );
    }).toList();

    setState(() {
      _list = tempList;
    });

    print(allInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device演示'),
      ),
      body: ListView(
        children: _list,
      ),
    );
  }
}
