
import 'package:device_ip/api/device_info_api.dart';
import 'package:device_ip/widget/info_widget.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'bug_ingo_page.dart';

class DeviceInfoPage extends StatefulWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  Map<String, dynamic> deviceInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getInfo();

    if (!mounted) return;
    setState(() => this.deviceInfo = deviceInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
         title: const Text("Device info check"),
          centerTitle: true,
        ),
        body: InfoWidget(map: deviceInfo),
      );
}