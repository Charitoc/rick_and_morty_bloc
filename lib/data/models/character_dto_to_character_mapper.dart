import 'package:rick_morty_bloc/data/models/character.dart';
import 'package:rick_morty_bloc/data/models/character_dto.dart';
import 'package:rick_morty_bloc/data/models/episode.dart';

class CharacterDTOtoCharacter {
  static List<Character> mapper(
      List<CharacterDTO> characterDTO, List<Episode> episodes) {
    List<Character> characterList = [];

    for (CharacterDTO characterDTO in characterDTO) {
      for (Episode episode in episodes) {
        if (episode.url == characterDTO.episode[0]) {
          Character character = Character(
            name: characterDTO.name,
            status: characterDTO.status,
            species: characterDTO.species,
            type: characterDTO.type,
            gender: characterDTO.gender,
            location: characterDTO.location.name,
            image: characterDTO.image,
            firstEpisode: episode.name,
          );
          characterList.add(character);
          break;
        }
      }
    }
    return characterList;
  }
}
