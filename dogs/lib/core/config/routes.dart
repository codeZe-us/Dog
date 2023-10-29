// import 'package:dogs/data_layer/models/breed_data_model.dart';
// import 'package:dogs/features/view/details_view.dart';
// import 'package:dogs/features/view/explore_view.dart';
// import 'package:dogs/features/view/intro_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../features/bloc/explore_list_bloc/explore_list_bloc.dart';

// class AppRoutes {
//   static const String intro = '/';
//   static const String explore = '/explore';
//   static const String breedDetails = '/details';
//   static const String saved = '/saved';

//   static Route<dynamic> generateRoutes(RouteSettings settings) {
//     switch (settings.name) {
//       case intro:
//         return MaterialPageRoute(builder: (_) => const IntroView());

//       case explore:
//         return MaterialPageRoute(builder: (_) => const ExploreView());

//       case breedDetails:
//         var model = settings.arguments as BreedDataModel;
//         return MaterialPageRoute(
//           builder: (_) => DetailsView(
//             breedDataModel: model,
//           ),
//         );

//       default:
//         return MaterialPageRoute(
//           builder: (_) => const Scaffold(
//             body: Center(child: Text('No Route Found')),
//           ),
//         );
//     }
//   }

//   final _router = GoRouter(
//     debugLogDiagnostics: true,
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => const IntroView(),
//       ),
//       GoRoute(
//         name: 'explore',
//         path: '/explore',
//         builder: (context, state) {
//           return ExploreView(
//             key: state.pageKey,
//           );
//         },
//         routes: [
//           GoRoute(
//             name: 'details',
//             path: 'details/:name',
//             builder: (context, state) {
//               String? name = state.pathParameters['name'];
//               var breedDataModel =
//                   context.read<ExploreListBloc>().state.breedFromName(name);

//               return DetailsView(
//                 key: state.pageKey,
//                 breedDataModel: breedDataModel!,
//               );
//             },
//           ),
//         ],
//       ),
//     ],
//   );
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/data_layer/models/breed_data_model.dart';
import '../../features/bloc/explore_list_bloc/explore_list_bloc.dart';
import '../../features/screens/details_view.dart';
import '../../features/screens/explore_view.dart';
import '../../features/screens/intro_view.dart';



class AppRouter {
  static const String intro = '/';
  static const String explore = '/explore';
  static const String breedDetails = '/details';
  static const String saved = '/saved';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroView());

      case explore:
        return MaterialPageRoute(builder: (_) => const ExploreView());

      case breedDetails:
        var model = settings.arguments as BreedDataModel;
        return MaterialPageRoute(
          builder: (_) => DetailsView(
            breedDataModel: model,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Route Found')),
          ),
        );
    }
  }

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const IntroView(),
      ),
      GoRoute(
        name: 'explore',
        path: '/explore',
        builder: (context, state) {
          return ExploreView(
            key: state.pageKey,
          );
        },
        routes: [
          GoRoute(
            name: 'details',
            path: 'details/:name',
            builder: (context, state) {
              String? name = state.pathParameters['name'];
              var breedDataModel =
                  context.read<ExploreListBloc>().state.breedFromName(name);

              return DetailsView(
                key: state.pageKey,
                breedDataModel: breedDataModel!,
              );
            },
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}


