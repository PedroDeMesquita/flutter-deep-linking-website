import 'package:miscelaneos/domain/datasources/pokemons_datasource.dart';
import 'package:miscelaneos/domain/entities/pokemon.dart';
import 'package:miscelaneos/domain/repositories/pokemons_repository.dart';
import 'package:miscelaneos/infrastructure/datasources/pokemon_datasource_impl.dart';

class PokemonRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;
  PokemonRepositoryImpl({PokemonsDatasource? datasource})
      : datasource = datasource ?? PokemonDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) {
    return datasource.getPokemon(id);
  }
}
