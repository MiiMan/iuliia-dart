import 'package:iuliia/iuliia.dart';
import 'package:test/test.dart';


void main() {
  test('Check sample identity', () {
    for (final sc in Schemas.values) {
      print(sc);
      final Iuliia iuliia = Iuliia(sc);
      expect(iuliia.translate(iuliia.schema.samples[0][0]), iuliia.schema.samples[0][1]);
      print('Passed');
    }
  });
}
