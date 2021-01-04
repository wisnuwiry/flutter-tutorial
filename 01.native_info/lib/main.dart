import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _appName;
  String _versionName;
  String _versionCode;
  String _packageName;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final _packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _appName = _packageInfo.appName; // Ambil Data Nama Aplikasi

      _versionName = _packageInfo.version; // Ambil Data Nama Versi

      _versionCode = _packageInfo.buildNumber; // Ambil Data Kode Versi

      _packageName = _packageInfo.packageName; // Ambil Data Package Name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _buildItemTile('App Name', _appName),
          Divider(),
          _buildItemTile('Version Name', _versionName),
          Divider(),
          _buildItemTile('Version Code', _versionCode),
          Divider(),
          _buildItemTile('Package Name', _packageName),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildItemTile(String key, String value) {
    return ListTile(
      title: Row(
        children: [
          Expanded(child: Text('$key : ')),
          Text(value ?? ''),
        ],
      ),
    );
  }
}
