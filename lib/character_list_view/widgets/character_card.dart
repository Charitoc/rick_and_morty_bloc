import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/character_dto.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/character_list_view/views/character_details_screen.dart';

// class ScreenArguments {
//   final String title;
//   final String message;

//   ScreenArguments(this.title, this.message);
// }

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CharacterDetailsScreen.route(context, character: character));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            // width: MediaQuery.of(context).size.width - 20,
            height: 140,
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Row(
              children: [
                Flexible(
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/placeholder.png'),
                    image: NetworkImage(
                      character.image,
                      // fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
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
                          Flexible(
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
                                  child: Text(
                                      "${character.status} - ${character.species} ",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
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
                          const Text(
                            "First seen in:",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              character.firstEpisode,
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
