import 'package:dio/dio.dart';
import 'package:flutter_repository_pokedex_demo/models/poke_model.dart';
import 'package:flutter_repository_pokedex_demo/repositories/poke_repository_interface.dart';

class PokeRepository implements PokeInterfaceRepository {
  Dio _dio = Dio();

  PokeRepository(this._dio);

  @override
  Future<List<PokeModel>> getAllPokemons() async {
    List<PokeModel> pokemons = [];

    var response =
        await _dio.get('https://pokeapi.co/api/v2/pokemon?offset=20&limit=5');

    response.data['results'].map((pokemon) {
      pokemons.add(PokeModel.fromJson(pokemon));
    }).toList();
    return pokemons;
  }
}
