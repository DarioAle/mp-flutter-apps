import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'home/home.dart';

void main() async {
  // final storage = await getApplicationDocumentsDirectory();
  WidgetsFlutterBinding.ensureInitialized();
  final storageExternal = await getExternalStorageDirectory();
  Hive.init(storageExternal.path);
  await Hive.openBox("configs");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'persistencia',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Persistencia de datos"),
        ),
        body: Home(),
      ),
    );
  }
}
