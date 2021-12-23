import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  static const routeName = '/character_details_screen';

  const CharacterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;
    print(character);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            character.image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          FittedBox(
            child: Text(
              character.name,
              style: const TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
        ],
      ),
    );
  }
}
