import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

class CharacterStatus extends StatelessWidget {
  const CharacterStatus({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                color: character.status == "Alive"
                    ? Colors.lightGreenAccent
                    : character.status == "Dead"
                        ? Colors.red
                        : Colors.grey[350],
                borderRadius: BorderRadius.circular(90)),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text("${character.status} - ${character.species} ",
                style: const TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
