import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/presentation/character_details/views/character_details_screen.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class CharacterCard extends StatelessWidget {
  final Character character;
  final Map<int, String> map;
  const CharacterCard({Key? key, required this.character, required this.map})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CharacterDetailsScreen.routeName, arguments: character);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Row(
              children: [
                FadeInImage(
                    fit: BoxFit.fitHeight,
                    placeholder: const AssetImage('assets/placeholder.png'),
                    image: NetworkImage(character.image)),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(character.name,
                                maxLines: 2,
                                softWrap: true,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
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
                              Text(
                                  "${character.status} - ${character.species} ",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          const Text(
                            "Last known location:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            character.location.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "First seen in:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              map[character.id] ?? '',
                              // character.episode[0],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
