import 'package:rick_morty_bloc/data/dataproviders/data_provider.dart';
import 'package:rick_morty_bloc/data/models/all_characters.dart';
import 'package:rick_morty_bloc/data/models/character.dart';

class CharacterRepository {
  final _provider = DataProvider();
  late final Character singleCharacter;
  late final AllCharacters pageCharacters;
  List<Character> characterList = [];

  Future printHello() async {
    print("Got in hello");
  }

  Future<void> getCharacter() async {
    singleCharacter = await DataProvider.getSingleCharacter();
    print(singleCharacter.name);
    characterList.add(singleCharacter);
  }

  Future<List<Character>> getAllCharacters() async {
    pageCharacters = await DataProvider?.getPageCharacters();
    print('Got in getAllCharacters');
    characterList.addAll(pageCharacters.characters);
    print(characterList.length);
    return characterList;
  }
}
