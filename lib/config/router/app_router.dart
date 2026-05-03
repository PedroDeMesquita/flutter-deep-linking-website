import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/pokemon/pokemon_screen.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionsScreen(),
    ),

    // Sensors
    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => const GyroscopeScreen(),
    ),

    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => const AccelerometerScreen(),
    ),

    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen(),
    ),

    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen(),
    ),

    GoRoute(
      path: '/compass',
      builder: (context, state) => const CompassScreen(),
    ),

    // Pokémons list
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
    ),

    // Pokémon detail (deep link target)
    GoRoute(
      path: '/pokemons/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return PokemonScreen(pokemonId: id);
      },
    ),
  ],
);
