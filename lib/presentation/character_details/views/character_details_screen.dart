import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/characterDTO.dart';

class CharacterDetailsScreen extends StatelessWidget {
  static const routeName = '/character_details_screen';

  const CharacterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;
    print(character);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  character.image,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FittedBox(
                child: Text(
                  character.name,
                  style: const TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            FittedBox(
              child: Text(
                "Species: ${character.species}",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Type: ${character.type != '' ? character.type : '-'}",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Gender: ${character.gender}",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Text(
                "Location: ${character.location}",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
