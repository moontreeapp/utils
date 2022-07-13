/// divisibility of 0 is no decimal places, 1 is one.

import 'package:utils/extensions/string.dart';
import 'package:utils/string.dart';

int invertDivisibility(int divisibility) => (16 + 1) % (divisibility + 8 + 1);

double satToAmount(int x) => (x / 100000000);
int amountToSat(double x) => (x * 100000000).floor().toInt();

String removeChars(
  String text, {
  String? chars,
}) {
  chars = chars ?? punctuationProblematic;
  for (var char in chars.characters) {
    text = text.replaceAll(char, '');
  }
  return text;
}

List enumerate(String text) {
  return List<int>.generate(text.length, (i) => (i + 1) - 1);
}

String removeCharsOtherThan(
  String text, {
  String? chars,
}) {
  chars = chars ?? alphanumeric;
  var ret = '';
  for (var char in text.characters) {
    if (chars.contains(char)) {
      ret = '$ret$char';
    }
  }
  return ret;
}
