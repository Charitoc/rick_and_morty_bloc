import 'package:flutter/material.dart';

Widget wrapWithScaffoldApp(Widget widget, {NavigatorObserver? observer}) {
  return wrapWithMaterialApp(
      Scaffold(
        body: widget,
      ),
      observer);
}

Widget wrapWithMaterialApp(Widget widget, NavigatorObserver? observer) {
  if (observer == null) {
    return MaterialApp(
      home: widget,
      debugShowCheckedModeBanner: false,
    );
  }
  return MaterialApp(
    home: widget,
    navigatorObservers: [observer],
  );
}
