import 'package:miscelaneos/presentation/providers/sensors/accelerometer_providers.dart';
import 'package:miscelaneos/presentation/screens/sensors/accelerometer_screen.dart';
export 'package:flutter/material.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accelerometer$ = ref.watch(accelerometerUserProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Acelerômetro'),
          centerTitle: true, // centraliza o título na AppBar
        ),
        body: Center(
            child: accelerometer$.when(
          data: (value) => Text(
            value.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          error: (error, stack) => Text('Erro: $error'),
          loading: () => const CircularProgressIndicator(),
        )));
  }
}
