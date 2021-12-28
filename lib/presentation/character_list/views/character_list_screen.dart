import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/presentation/character_list/bloc/character_bloc.dart';
import 'package:rick_morty_bloc/presentation/character_list/views/character_card.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = context.read<CharacterRepository>();
    return BlocProvider(
      create: (context) =>
          CharacterBloc(repository)..add(CharactersFetchingEvent()),
      child: CharacterListScreen(),
    );
  }
}

class CharacterListScreen extends StatelessWidget {
  final scrollcontroller = ScrollController();

  CharacterListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void pagination() {
      if (scrollcontroller.position.pixels ==
          scrollcontroller.position.maxScrollExtent) {
        context.read<CharacterBloc>().add(CharactersFetchingEvent());
      }
    }

    scrollcontroller.addListener(pagination);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text("Rick and Morty"),
        ),
        body: BlocBuilder<CharacterBloc, CharactersState>(
            builder: (context, state) {
          if (state.isLoading == true) {
            print("Got in Characters Fetching");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print("characters length ${state.characters.length}");
          return ListView.builder(
              controller: scrollcontroller,
              itemCount: state.characters.length,
              itemBuilder: (ctx, index) => CharacterCard(
                    character: state.characters[index],
                    map: state.map,
                  ));
        }));
  }
}



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