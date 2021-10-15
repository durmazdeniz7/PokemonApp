import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/pages/pokemon_detail.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late Pokedex pokedex;
  late Future<Pokedex> poke;

  Future<Pokedex> _getPokemon() async {
    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    poke = _getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon"),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, oritentation) {
          if (oritentation==Orientation.portrait) {
            return FutureBuilder(
              future: poke,
              builder: (BuildContext context, AsyncSnapshot<Pokedex> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PokemonDetail(
                                      pokemon: snapshot.data!.pokemon[index])));
                            },
                            child: Hero(
                              tag: snapshot.data!.pokemon[index].img,
                              child: Card(
                                elevation: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: 150,
                                        width: 200,
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/2.gif",
                                          image: snapshot.data!.pokemon[index].img,
                                          fit: BoxFit.contain,
                                        )),
                                    Text(
                                      snapshot.data!.pokemon[index].name,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                    //GridView.count(
                    //   crossAxisCount: 2,
                    //   children: snapshot.data!.pokemon.map((e) {
                    //     return Text(e.name);
                    //   }).toList(),
                    // );
                  } else {
                    return const Center(
                      child: Text("Null Değer var"),
                    );
                  }
      
                  /* return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
                      return Center(child: Text(snapshot.data!.pokemon[index].name),);
                    }); */
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              });
            
          }
          else{
            return FutureBuilder(
              future: poke,
              builder: (BuildContext context, AsyncSnapshot<Pokedex> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PokemonDetail(
                                      pokemon: snapshot.data!.pokemon[index])));
                            },
                            child: Hero(
                              tag: snapshot.data!.pokemon[index].img,
                              child: Card(
                                elevation: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: 150,
                                        width: 200,
                                        child: FadeInImage.assetNetwork(
                                          placeholder: "assets/2.gif",
                                          image: snapshot.data!.pokemon[index].img,
                                          fit: BoxFit.contain,
                                        )),
                                    Text(
                                      snapshot.data!.pokemon[index].name,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                    //GridView.count(
                    //   crossAxisCount: 2,
                    //   children: snapshot.data!.pokemon.map((e) {
                    //     return Text(e.name);
                    //   }).toList(),
                    // );
                  } else {
                    return const Center(
                      child: Text("Null Değer var"),
                    );
                  }
      
                  /* return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
                      return Center(child: Text(snapshot.data!.pokemon[index].name),);
                    }); */
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              });
          }
          
        }
      ),
    );
  }
}
