import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

class CharacterName extends StatelessWidget {
  const CharacterName({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(character.name,
          maxLines: 2,
          softWrap: true,
          style: const TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
    );
  }
}
