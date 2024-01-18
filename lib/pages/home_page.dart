import 'package:flutter/material.dart';
import 'package:flutter_application_6/widgets/character_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: Container(
        child: ListView(
          children: [CharacterWidget()],
        ),
      ),
    );
  }
}
