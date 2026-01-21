import 'package:flutter/material.dart'; 
import 'package:pokedex_flutter/widgets/pokemon_card_background.dart'; 
import 'package:pokedex_flutter/widgets/pokemon_card_data.dart';

class PokemonCard extends StatelessWidget {
  final String id;
  final String name;
  final String image;

  const PokemonCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  BoxDecoration getContainerDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: getContainerDecoration(),
      child: Stack(
        children: [
          PokemonCardBackground(id: id),
          PokemonCardData(name: name, image: image),
        ],
      ),
    );
  }
}