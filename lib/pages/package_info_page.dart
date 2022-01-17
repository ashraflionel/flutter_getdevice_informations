import 'package:device_ip/api/ip_info_api.dart';
import 'package:device_ip/api/package_info_api.dart';
import 'package:device_ip/widget/info_widget.dart';
import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class PackageInfoPage extends StatefulWidget {
  @override
  _PackageInfoPageState createState() => _PackageInfoPageState();
}

class _PackageInfoPageState extends State<PackageInfoPage> {
  Map<String, dynamic> packageInfo = {};

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final packageInfo = await PackageInfoApi.getInfo();
    final ipAddress = await IpInfoApi.getIPAddress();

    final newPackageInfo = {
      'ipAddress': ipAddress,
      ...packageInfo,
    };

    if (!mounted) return;

    setState(() => this.packageInfo = newPackageInfo);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
         title: const Text("Device info check"),
          centerTitle: true,
        ),
        body: InfoWidget(map: packageInfo),
      );
}