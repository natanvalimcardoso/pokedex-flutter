import 'package:flutter/material.dart';
import 'package:flutter_pokedex_2021/common/models/pokemon.dart';
import 'package:flutter_pokedex_2021/features/pokedex/screens/home/pages/widget/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(pokemon.name),
          Row(
            children: [
              Column(
                children: pokemon.type
                    .map((e) => TypeWidget(
                          name: e,
                        ))
                    .toList(),
              ),
              Image.network(pokemon.image)
            ],
          )
        ],
      ),
    );
  }
}
