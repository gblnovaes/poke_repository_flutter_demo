import 'package:flutter_repository_pokedex_demo/models/poke_model.dart';

abstract class PokeInterfaceRepository {
  Future<List<PokeModel>> getAllPokemons();
}
