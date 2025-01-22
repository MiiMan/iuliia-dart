import 'package:iuliia/src/iuliia.dart';
import 'package:iuliia/src/schemas.dart';

void main() {
  final iuliia = Iuliia(Schemas.icaoDoc9303);

  print(iuliia.translate('Юлия, съешь ещё этих мягких французских булок из Йошкар-Олы, да выпей алтайского чаю.'));
}
