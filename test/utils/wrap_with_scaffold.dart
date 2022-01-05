import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/presentation/character_details/views/character_details_screen.dart';

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
        routes: {
          CharacterDetailsScreen.routeName: (ctx) => CharacterDetailsScreen(),
        });
  }
  return MaterialApp(
    home: widget,
    navigatorObservers: [observer],
  );
}
