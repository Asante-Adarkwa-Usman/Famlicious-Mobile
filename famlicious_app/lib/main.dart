import 'package:famlicious_app/views/auth/create_account_view.dart';
import 'package:famlicious_app/views/home/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famlicious App',
      theme:  ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: const Color.fromRGBO(249, 251, 252, 1),
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 54, fontWeight: FontWeight.bold),
        ),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black)),
        inputDecorationTheme: const InputDecorationTheme(
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            labelStyle: TextStyle(color: Colors.black)),
        buttonTheme: const ButtonThemeData(
          colorScheme: ColorScheme.dark(primary: Colors.white),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey.shade900,
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)),
        inputDecorationTheme: const InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelStyle: TextStyle(color: Colors.white)),
        buttonTheme: const ButtonThemeData(
          colorScheme: ColorScheme.dark(primary: Colors.white),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const CreateAccountView(),
    );
  }
}
