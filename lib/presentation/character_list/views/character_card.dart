import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/repositories/character_repository.dart';
import 'package:rick_morty_bloc/presentation/character_details/views/character_details_screen.dart';

class CharacterCard extends StatelessWidget {
  final CharacterRepository repository;
  final int index;

  const CharacterCard(this.repository, this.index, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Character character = repository.characterList[index];
    return GestureDetector(
      onTap: () {
        repository.getCharacter();
        print(repository.characterList);
        Navigator.of(context).pushNamed(CharacterDetailsScreen.routeName);
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
                Image.network(repository.characterList[index].image),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(repository.characterList[index].name,
                              maxLines: 2,
                              softWrap: true,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
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
                                      color: Colors.white, fontSize: 12)),
                            ],
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
