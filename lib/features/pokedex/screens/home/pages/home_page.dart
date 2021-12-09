import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/container/detail_container.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap}) : super(key: key);
  final List<Pokemon> list;
  final Function(String , DetailsArguments)  onItemTap;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name),
            onTap: ()  => onItemTap('/details', DetailsArguments(name: list[index].name)),
          );
        },
      ),
    );
  }
}
