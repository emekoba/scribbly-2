import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribbly/app_data.dart';
import 'package:scribbly/pages/home_view.dart';
import 'package:scribbly/widgets/dismiss_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scribbly',
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      home: const HomeView(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
