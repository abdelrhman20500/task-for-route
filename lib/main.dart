import 'package:flutter/material.dart';
import 'package:task_for_route/api/api_manager.dart';
import 'package:task_for_route/ui/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiManager.getProduct();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

