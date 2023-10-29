import 'package:dogs/core/config/routes.dart';
import 'package:dogs/core/constant/strings.dart';
import 'package:dogs/data/data_layer/local_data_source/local_breed_list.dart';
import 'package:dogs/data/data_layer/remote_api/base_api.dart';
import 'package:dogs/data/data_layer/remote_api/details_scapper.dart';
import 'package:dogs/data/data_layer/remote_api/dog_api.dart';
import 'package:dogs/features/bloc/details_bloc/breed_details_bloc.dart';
import 'package:dogs/features/bloc/explore_list_bloc/explore_list_bloc.dart';
import 'package:dogs/domain/repository/breed_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'core/config/theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final breedRepo = BreedRepository(
      localBreedList: LocalBreedList(),
      dogApi: DogApi(ApiHandler()),
      detailsScraper: DetailsScraper(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ExploreListBloc>(
          create: (_) => ExploreListBloc(breedRepo)..add(ExploreListInitial()),
        ),
        BlocProvider<BreedDetailsBloc>(
          create: (_) => BreedDetailsBloc(breedRepo),
        ),
      ],
      child: MaterialApp.router(
        title: AppStrings.appName,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
    );
  }
}
