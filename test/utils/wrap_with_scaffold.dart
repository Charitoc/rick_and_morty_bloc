import 'package:flutter/material.dart';

Widget wrapWithScaffoldApp(Widget widget, {BuildContext? context}) {
  return wrapWithMaterialApp(
      Scaffold(
        body: widget,
      ),
      context);
}

Widget wrapWithMaterialApp(Widget widget, BuildContext? context) {
  if (context != null) {
    return MaterialApp(
      home: widget,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[850],
        backgroundColor: const Color.fromRGBO(60, 62, 68, 1),
        scaffoldBackgroundColor: const Color.fromRGBO(36, 40, 47, 1),
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[850]),
        primarySwatch: Colors.blue,
      ),
    );
  }
  return MaterialApp(
    home: widget,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.grey[850],
      backgroundColor: const Color.fromRGBO(60, 62, 68, 1),
      scaffoldBackgroundColor: const Color.fromRGBO(36, 40, 47, 1),
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey[850]),
      primarySwatch: Colors.blue,
    ),
    // navigatorObservers: [observer],
  );
}
