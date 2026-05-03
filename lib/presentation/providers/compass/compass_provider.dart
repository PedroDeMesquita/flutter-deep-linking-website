import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final compassProvider = StreamProvider<double>((ref) async* {
  try {
    final stream = FlutterCompass.events;

    if (stream == null) {
      throw Exception('Device does not have compass sensor');
    }

    await for (final event in stream) {
      final heading = event.heading;

      if (heading != null) {
        yield heading;
      }
    }
  } catch (e) {
    throw Exception('Error getting heading: $e');
  }
});
