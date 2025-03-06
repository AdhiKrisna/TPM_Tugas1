import 'package:flutter/material.dart';
import 'package:tugas_1/routes/route_names.dart';
import 'package:tugas_1/routes/route_pages.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: RouteName.login,
      onGenerateRoute: RoutePages.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
