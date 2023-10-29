import 'package:dogs/data/data_layer/remote_api/details_scapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailsScraper tests', () {
    late DetailsScraper detailsScraper;

    setUp(() {
      detailsScraper = DetailsScraper();
    });

    test('getDetails returns a list of details for a breed', () async {
      String breedName = 'affenpinscher';
      List<String> details = await detailsScraper.getDetails(breedName);
      expect(details, isNotEmpty);
    });

    test('getDetails returns an empty list for an invalid breed', () async {
      String breedName = 'invalid_breed';
      List<String> details = await detailsScraper.getDetails(breedName);
      expect(details, isEmpty);
    });
  });
}
