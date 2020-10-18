import 'package:flutter/material.dart';
import 'package:flutter_repository_pokedex_demo/home/controllers/home_controller.dart';
import 'package:flutter_repository_pokedex_demo/models/poke_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homecontroller = HomeController();

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Lista de Pokemons"),
        ),
        body: FutureBuilder<List<PokeModel>>(
          future: _homecontroller.fetchPokemons(),
          builder: (context, snapshot) {
            var pokemons = snapshot.data;

            if (pokemons == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pokemons[index].name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
