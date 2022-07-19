import 'dart:math';
import 'dart:typed_data';

Uint8List randomBytes(int n) {
  final generator = Random.secure();
  final random = Uint8List(n);
  for (var i = 0; i < random.length; i++) {
    random[i] = generator.nextInt(255);
  }
  return random;
}

/// Generates a positive (psuedo-)random integer uniformly distributed on the
/// range from [min], inclusive, to [max], exclusive.
int randomInRange(int min, int max, [Random? generator]) =>
    min + (generator ?? Random()).nextInt(max - min);

/// return a (psuedo-)random item from the iterable
int chooseAtRandom(Iterable items, [Random? generator]) =>
    items.toList()[(generator ?? Random()).nextInt(items.length)];

/// given a string a deterministic random object is returned
Random deterministicRandom(dynamic seed) => Random(seed.hashCode);

/// provides a random int within range 0 - 2^32 which is the max possible range
int maxRandomInt([dynamic seed]) =>
    (seed != null ? deterministicRandom(seed) : Random()).nextInt(4294967296);
