import 'package:flutter/material.dart';
import 'package:pokedex/pages/pokemon_list.dart';


void main()=>runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: const PokemonList(),
      
    );
  }
}