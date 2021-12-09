import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/error/failure.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/common/widget/po_error.dart';
import 'package:pokedex_flutter/common/widget/po_loading.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/detail_page.dart';

class DetailsArguments{
  final String name;
  DetailsArguments({required this.name});
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key, required this.repository, required this.arguments}) : super(key: key);
  final IPokemonRepository repository;
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(builder: (context, snapshot) {
      future: repository.getAllPokemons();
      if (snapshot.connectionState == ConnectionState.waiting) {
        return PoLoading();
      }
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return DetailPage(name: arguments.name, list: snapshot.data! );
      }
      if (snapshot.hasError) {
        return PoError(
          error: (snapshot.error as Failure).message!,
        );
      }
      return Container(); // AQUI é caso ele não entre em nenhum desses estados ele retorna um container
    });
  }
}