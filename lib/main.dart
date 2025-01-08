import 'package:flutter/material.dart';
import 'package:todoapp/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initial hive offline database
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
