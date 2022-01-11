import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

class CharacterCardImage extends StatelessWidget {
  const CharacterCardImage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 140,
      child: FadeInImage(
        placeholder: const AssetImage('assets/placeholder.png'),
        image: NetworkImage(
          character.image,
        ),
      ),
    );
  }
}
