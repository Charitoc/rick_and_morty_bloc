import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/presentation/character_details/views/character_details_screen.dart';
import 'package:rick_morty_bloc/presentation/character_list/views/character_list_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp(
    repository: CharacterRepository(remoteDS: ApiProvider.instance),
  ));
}

class MyApp extends StatelessWidget {
  final CharacterRepository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => repository,
      child: MaterialApp(
        title: 'Rick and Morty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.grey[850],
          backgroundColor: const Color.fromRGBO(60, 62, 68, 1),
          scaffoldBackgroundColor: const Color.fromRGBO(36, 40, 47, 1),
          appBarTheme: AppBarTheme(backgroundColor: Colors.grey[850]),
          primarySwatch: Colors.blue,
        ),
        home: const CharacterListPage(),
        routes: {
          CharacterDetailsScreen.routeName: (ctx) => CharacterDetailsScreen()
        },
      ),
    );
  }
}
