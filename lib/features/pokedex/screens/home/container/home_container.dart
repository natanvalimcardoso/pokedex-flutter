import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/error/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/detail_page.dart';

import 'package:pokedex_flutter/features/pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository, required this.onItemTap}) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailsArguments)  onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(builder: (context, snapshot) {
      future: repository.getAllPokemons();
      if (snapshot.connectionState == ConnectionState.waiting) {
        // ignore: prefer_const_constructors
        return HomeLoading();
      }
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return HomePage(list: snapshot.data!, onItemTap: onItemTap,);
      }
      if (snapshot.hasError) {
        return HomeError(
          error: (snapshot.error as Failure).message!,
        );
      }
      return Container(); // AQUI é caso ele não entre em nenhum desses estados ele retorna um container
    });
  }
}
