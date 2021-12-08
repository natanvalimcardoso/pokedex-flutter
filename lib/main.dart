import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/features/details/home/pages/home_loading.dart';
import 'package:pokedex_flutter/features/details/home/pages/home_page.dart';

import 'features/details/home/container/home_container.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // ignore: prefer_const_constructors
      home: HomeContainer(repository: PokemonRepository(),),
    );
  }
}


  

