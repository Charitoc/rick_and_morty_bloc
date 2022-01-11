import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_first_episode.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_image.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_location.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_name.dart';
import 'package:rick_morty_bloc/character_list_view/widgets/character_status.dart';
import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/character_list_view/views/character_details_screen.dart';

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
            height: 140,
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
            child: Row(
              children: [
                CharacterCardImage(character: character),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CharacterName(character: character),
                          CharacterStatus(character: character),
                          CharacterLocation(character: character),
                          CharacterFirstEpisode(character: character),
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
