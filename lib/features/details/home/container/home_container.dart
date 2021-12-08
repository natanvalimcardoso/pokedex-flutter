import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/features/details/home/pages/home_error.dart';
import 'package:pokedex_flutter/features/details/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/details/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(builder: (context, snapshot) {
      future: repository.getAllPokemons();
      if (snapshot.connectionState == ConnectionState.waiting) {
        return HomeLoading();
      }
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return HomePage(list: snapshot.data!);
      }
      if (snapshot.hasError) {
        return HomeError(
          error: snapshot.error.toString(),
        );
      }
      return Container(); // AQUI é caso ele não entre em nenhum desses estados ele retorna um container
    });
  }
}
