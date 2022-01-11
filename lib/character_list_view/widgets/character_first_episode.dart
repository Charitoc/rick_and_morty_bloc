import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

class CharacterFirstEpisode extends StatelessWidget {
  const CharacterFirstEpisode({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "First seen in:",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        FittedBox(
          child: Text(
            character.firstEpisode,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
