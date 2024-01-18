import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/character_responde/character_responde.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final CharacterResponde character;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(character.sprites!.frontDefault!),
          Text(character.name!)
        ],
      ),
    );
  }
}
