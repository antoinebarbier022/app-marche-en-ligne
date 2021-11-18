import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'view/pages/_pages.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Market',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        //scaffoldBackgroundColor: Colors.grey[50]
      ),
      home: HomePage(title: 'Online Market'),
    );
  }
}
