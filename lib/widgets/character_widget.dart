import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/character_responde/character_responde.dart';
import 'package:flutter_application_6/widgets/character_item.dart';
import 'package:http/http.dart' as http;

Future<CharacterResponde> fetchCharacter() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/'));

  if (response.statusCode == 200) {
    return CharacterResponde.fromJson(response.body);
  } else {
    throw Exception('failed');
  }
}

class CharacterWidget extends StatefulWidget {
  const CharacterWidget({super.key});

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  late Future<CharacterResponde> character;

  @override
  void initState() {
    super.initState();
    character = fetchCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<CharacterResponde>(
        future: character,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CharacterItem(character: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
