import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeXYZ {
  final double x;
  final double y;
  final double z;

  const GyroscopeXYZ(this.x, this.y, this.z);

  @override
  String toString() {
    return 'X: ${x.toStringAsFixed(2)} | '
        'Y: ${y.toStringAsFixed(2)} | '
        'Z: ${z.toStringAsFixed(2)}';
  }
}

final gyroscopeProvider =
    StreamProvider.autoDispose<GyroscopeXYZ>((ref) async* {
  await for (final event in gyroscopeEvents) {
    yield GyroscopeXYZ(event.x, event.y, event.z);
  }
});
