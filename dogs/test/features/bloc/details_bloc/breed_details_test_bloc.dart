
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dogs/features/bloc/details_bloc/breed_details_bloc.dart';
// import 'package:dogs/features/repository/breed_repo.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('BreedDetailsBloc tests', () {
//     late BreedRepository breedRepository;
//     late BreedDetailsBloc breedDetailsBloc;

//     setUp(() {
//       breedRepository = BreedRepository(dogApi: null, localBreedList: null, detailsScraper: null
//         // Initialize with appropriate dependencies for testing
//       );
//       breedDetailsBloc = BreedDetailsBloc(breedRepository);
//     });

//     blocTest<BreedDetailsBloc, BreedDetailsState>(
//       'emits [BreedDetailsState] when RetrieveDetailsEvent is added.',
//       build: () => breedDetailsBloc,
//       act: (bloc) => bloc.add(RetrieveDetailsEvent('breedName')),
//       expect: () => const <BreedDetailsState>[
//         BreedDetailsState(status: BreedDetailsStatus.retreived),
//       ],
//     );

//     blocTest<BreedDetailsBloc, BreedDetailsState>(
//       'emits [BreedDetailsState] with error status when an error occurs.',
//       build: () => breedDetailsBloc,
//       act: (bloc) => bloc.add(RetrieveDetailsEvent('invalidBreedName')),
//       expect: () => const <BreedDetailsState>[
//         BreedDetailsState(status: BreedDetailsStatus.error),
//       ],
//     );

//     // You can write more tests based on your requirements
//   });
// }
