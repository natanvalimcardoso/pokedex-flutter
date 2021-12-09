import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:pokedex_flutter/common/consts/api_consts.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>; // Converter a api recebida do response em dados traduzidos ele retorna um map
      final list = json['pokemon'] as List<Map<String, dynamic>>; // Olhei através do link o nome da lista que se chama pokemon e puxei ela
      list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {}
  }
}
