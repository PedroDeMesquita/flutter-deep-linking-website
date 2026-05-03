import 'package:flutter/material.dart';

class PokemonScreens extends StatelessWidget {
  final String pokemonId;

  const PokemonScreens({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons <name>'),
      ),
      body: Center(
        child: Text('Pokemon: $pokemonId'),
      ),
    );
  }
}
