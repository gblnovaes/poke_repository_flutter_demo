import 'package:dio/dio.dart';
import 'package:flutter_repository_pokedex_demo/models/poke_model.dart';
import 'package:flutter_repository_pokedex_demo/repositories/poke_repository.dart';
import 'package:flutter_repository_pokedex_demo/repositories/poke_repository_interface.dart';

class HomeController {
  final PokeInterfaceRepository _pokeRepository = PokeRepository(Dio());

  Future<List<PokeModel>> fetchPokemons() {
    return _pokeRepository.getAllPokemons();
  }
}
