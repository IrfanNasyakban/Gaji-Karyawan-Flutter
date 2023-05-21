import 'package:flutter/material.dart';
import 'package:gaji_karyawan/datakaryawan.dart';
import 'package:gaji_karyawan/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/next1': (context) => DataKaryawan(),
        // '/next2': (context) => NextPage2(),
        // ...
      },
    );
  }
}
