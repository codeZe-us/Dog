// import 'package:dogs/data_layer/local_data_source/local_breed_list.dart';
// import 'package:dogs/data_layer/remote_api/details_scapper.dart';
// import 'package:dogs/data_layer/remote_api/dog_api.dart';
// import 'package:dogs/features/repository/breed_repo.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// // Mock classes
// class MockLocalBreedList extends Mock implements LocalBreedList {}

// class MockDogApi extends Mock implements DogApi {}

// class MockDetailsScraper extends Mock implements DetailsScraper {}

// @GenerateMocks([LocalBreedList, DogApi, DetailsScraper])
// void main() {
//   group('BreedRepository', () {
//     late BreedRepository repository;
//     late MockLocalBreedList mockLocalBreedList;
//     late MockDogApi mockDogApi;
//     late MockDetailsScraper mockDetailsScraper;

//     setUp(() {
//       mockLocalBreedList = MockLocalBreedList();
//       mockDogApi = MockDogApi();
//       mockDetailsScraper = MockDetailsScraper();
//       repository = BreedRepository(
//         localBreedList: mockLocalBreedList,
//         dogApi: mockDogApi,
//         detailsScraper: mockDetailsScraper,
//       );
//     });

//     group('listOfBreeds', () {
//       test('returns list of BreedDataModel', () async {
//         // Mock the necessary methods for testing
//         when(mockLocalBreedList.getBreedList(start: 0, limit: 20)).thenReturn([
//           {'name': 'Bulldog', 'subBreeds': []},
//           {
//             'name': 'Poodle',
//             'subBreeds': ['Standard', 'Miniature', 'Toy']
//           },
//         ]);
//         when(mockDogApi.getRadomDogImage(breedName: anyNamed()))
//             .thenAnswer((_) async => ['image_url_here']);

//         final result = await repository.listOfBreeds();

//         // Verify the results
//         expect(result.length, 2);
//         expect(result.first.name, 'Bulldog');
//         expect(result.first.subBreed, []);
//         expect(result.last.name, 'Poodle');
//         expect(result.last.subBreed, ['Standard', 'Miniature', 'Toy']);
//       });
//     });

//     group('getBreedDetails', () {
//       test('returns BreedDetailsModel', () async {
//         // Mock the necessary methods for testing
//         when(mockDetailsScraper.getDetails())
//             .thenAnswer((_) async => ['description']);
//         when(mockDogApi.getRadomDogImage(
//                 breedName: anyNamed(), count: 3))
//             .thenAnswer(
//                 (_) async => ['image_url_1', 'image_url_2', 'image_url_3']);

//         final result = await repository.getBreedDetails('Bulldog');

//         // Verify the results
//         expect(result.breedName, 'Bulldog');
//         expect(result.breedDescription, ['description']);
//         expect(
//             result.breedImages, ['image_url_1', 'image_url_2', 'image_url_3']);
//       });
//     });
//   });
// }


