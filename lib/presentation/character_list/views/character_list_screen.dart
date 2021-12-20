import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/presentation/character_list/bloc/character_bloc.dart';
import 'package:rick_morty_bloc/presentation/character_details/views/character_details_screen.dart';
import 'package:rick_morty_bloc/presentation/character_list/views/character_card.dart';

class CharacterListScreen extends StatelessWidget {
  //Repository repository;
  //const CharacterListScreen({Key? key, this.repository}) : super(key: key);

  //CharacterListScreen({Key? key, required this.repository}) : super(key: key);

  //late Repository repository;
  //CharacterListScreen(this.repository);
  // late final Bloc bloc;

  // Future delay(CharactersState state) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   print(bloc.state);
  //   print("delay ended");
  // }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharacterBloc>(context);
    final repository = bloc.characterRepository;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text("Rick and Morty"),
        ),
        body: BlocBuilder<CharacterBloc, CharactersState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is CharacterFetchingState) {
                print("Got in Characters Fetching");
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: repository.characterList.length,
                  itemBuilder: (ctx, index) =>
                      CharacterCard(repository, index));
            }));
  }
}

// class CharacterListPage extends StatelessWidget {
//   const CharacterListPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CharacterBloc()..add(CharactersLoadingEvent()),
//       child: CharacterListView(),
//     );
//   }
// }

// class CharacterListView extends StatelessWidget {
//   const CharacterListView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CharacterBloc, CharactersState>(
//       builder: (context, state) {
//         return Container();
//       },
//     );
//   }
// }
// ;