import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonDetail extends StatefulWidget {

  Pokemon pokemon;
  PokemonDetail({required this.pokemon, Key? key}) : super(key: key);

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  late PaletteGenerator  _paletteColor;
  Color appColor=Colors.pink;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _findAppColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(widget.pokemon.name),
        centerTitle: true,
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return portraitMode(context);
          } else {
            return landsCapeMode(context);
          }
        },
      ),
    );
  }

  Stack portraitMode(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width - 20,
          height: MediaQuery.of(context).size.height * (7 / 10),
          left: 10,
          top: MediaQuery.of(context).size.height * (1 / 6),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  widget.pokemon.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "HEIGHT : " + widget.pokemon.height,
                ),
                Text(
                  "WEIGHT : " + widget.pokemon.weight,
                ),
                const Text(
                  "TYPES: ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.type.map((e) {
                    return Chip(
                        backgroundColor: Colors.deepOrange,
                        label: Text(
                          e.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ));
                  }).toList(),
                ),
                const Text(
                  "PRE EVOLUTION",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.pokemon.prevEvolution.isNotEmpty
                      ? widget.pokemon.prevEvolution.map((e) {
                          return Chip(
                              backgroundColor: Colors.deepOrange,
                              label: Text(e!.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16)));
                        }).toList()
                      : <Widget>[const Text("END STAGE")],
                ),
                const Text(
                  "NEXT EVOLUTION",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.pokemon.nextEvolution.isNotEmpty
                      ? widget.pokemon.nextEvolution.map((e) {
                          return Chip(
                              backgroundColor: Colors.deepOrange,
                              label: Text(e!.name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16)));
                        }).toList()
                      : <Widget>[
                          const Text(
                            "END STAGE",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                ),
                const Text(
                  "Weaknesses",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.pokemon.weaknesses.map((e) {
                    return Chip(
                        backgroundColor: Colors.deepOrange,
                        label: Text(e,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)));
                  }).toList(),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    widget.pokemon.img,
                    fit: BoxFit.cover,
                  ))),
        )
      ],
    );
  }

  Widget landsCapeMode(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * (3.4),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 2,
          child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                  width: 250,
                 
                  child: Image.network(
                    widget.pokemon.img,
                    fit: BoxFit.fill,
                  ))),
        ),
        Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.1,
                  // ),
                  Text(
                    widget.pokemon.name,
                    style: const TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "HEIGHT : " + widget.pokemon.height,
                  ),
                  Text(
                    "WEIGHT : " + widget.pokemon.weight,
                  ),
                  const Text(
                    "TYPES: ",
                    style: TextStyle( fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.pokemon.type.map((e) {
                      return Chip(
                          backgroundColor: appColor,
                          label: Text(
                            e.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ));
                    }).toList(),
                  ),
                  const Text(
                    "PRE EVOLUTION",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.pokemon.prevEvolution.isNotEmpty
                        ? widget.pokemon.prevEvolution.map((e) {
                            return Chip(
                                backgroundColor: appColor,
                                label: Text(e!.name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16)));
                          }).toList()
                        : <Widget>[const Text("END STAGE")],
                  ),
                  const Text(
                    "NEXT EVOLUTION",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.pokemon.nextEvolution.isNotEmpty
                        ? widget.pokemon.nextEvolution.map((e) {
                            return Chip(
                                backgroundColor:appColor,
                                label: Text(e!.name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16)));
                          }).toList()
                        : <Widget>[
                            const Text(
                              "END STAGE",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
                  ),
                  const Text(
                    "Weaknesses",
                    style: TextStyle( fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.pokemon.weaknesses.map((e) {
                      return Chip(
                          backgroundColor: appColor,
                          label: Text(e,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16)));
                    }).toList(),
                  )
                ],
              ),
            ))
      ]),
    );
  }
  void _findAppColor() async{
    _paletteColor=await PaletteGenerator.fromImageProvider(NetworkImage(widget.pokemon.img));
    setState(() {
      appColor=_paletteColor.dominantColor!.color;
    });
  }
}
