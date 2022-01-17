// ignore_for_file: deprecated_member_use

import 'dart:io';
// ignore: unused_import
import 'package:device_info/device_info.dart';
import 'package:device_ip/pages/bug_ingo_page.dart';
import 'package:device_ip/pages/device_info_page.dart';
import 'package:device_ip/pages/package_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  static final String title =
      '${Platform.isAndroid ? 'Android' : 'iOS'} Device Info';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.pink),
        home: MainPage(),
      );
}

// ignore: use_key_in_widget_constructors
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    // ignore: prefer_const_declarations
    final style =   const TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.email),
          title: Text('Bug Report', style: style),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.perm_device_info),
          title: Text('DeviceInfo', style: style),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.info_outlined),
          title: Text('PackageInfo'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return BugInfoPage();
      case 1:
        return const DeviceInfoPage();
      case 2:
        return PackageInfoPage();
      default:
        return Container();
    }
  }
}