import 'package:pokedex_flutter/common/models/pokemon.dart';

abstract class IPokemonRepository{
  Future<List<Pokemon>> getAllPokemons();
}
class PokemonRepository implements IPokemonRepository{
  @override
  Future<List<Pokemon>> getAllPokemons(){

  }
}
