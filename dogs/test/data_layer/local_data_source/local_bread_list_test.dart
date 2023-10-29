import 'package:dogs/data/data_layer/local_data_source/local_breed_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocalBreedList tests', () {
    late LocalBreedList localBreedList;

    setUp(() {
      localBreedList = LocalBreedList();
    });

    test('getBreedList returns a sublist of breeds', () {
      List<Map<String, dynamic>> breedList = localBreedList.getBreedList(start: 0, limit: 5);
      expect(breedList.length, 5);
    });

    test('getBreedDetails returns breed details for affenpinscher', () {
      String details = localBreedList.getBreedDetails('affenpinscher');
      expect(details, 'This is the details');
    });
  });
}
