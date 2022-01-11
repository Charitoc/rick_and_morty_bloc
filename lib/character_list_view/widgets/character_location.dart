import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

class CharacterLocation extends StatelessWidget {
  const CharacterLocation({
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
          "Last known location:",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          character.location,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
