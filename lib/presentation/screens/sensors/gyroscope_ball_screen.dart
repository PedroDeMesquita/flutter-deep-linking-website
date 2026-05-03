import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/sensors/gyroscope_provider.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Giroscopio'),
        ),
        body: SizedBox.expand(
          child: gyroscope$.when(
            data: (value) => MovingBall(x: value.x, y: value.y),
            error: (error, stack) => Text('Erro: $error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}

class MovingBall extends StatelessWidget {
  final double x;
  final double y;

  const MovingBall({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    double screenWidth = size.width;
    double screenHeight = size.height;

    double currentXPos = (x * 100);
    double currentYPos = (y * 100);

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          left: (screenWidth / 2) + (currentXPos - 25),
          top: (screenHeight / 2) + (currentYPos - 25),
          child: const Ball(),
        ),
        Text(
          'X: $x, Y: $y',
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
