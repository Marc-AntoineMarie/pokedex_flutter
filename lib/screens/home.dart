import '../models/poke_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../api/pokeapi.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    List<Pokemon> pokemon = [];

    @override
    void initState() {
        super.initState();
        getPokemonFromPokeApi();
    }

void getPokemonFromPokeApi() async {
    PokeAPI.getPokemon().then((response) {
    List<Map<String, dynamic>> data =
        List.from(json.decode(response.body)['results']);
    setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {
                element.value['id'] = element.key + 1;
                element.value['img'] = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
                return Pokemon.fromJson(element.value);
            }).toList();
        });
    });
}
}