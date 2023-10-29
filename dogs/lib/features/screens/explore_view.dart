import 'package:dogs/core/constant/colors.dart';
import 'package:dogs/core/utils/extension.dart';
import 'package:dogs/data/data_layer/models/breed_data_model.dart';
import 'package:dogs/features/bloc/explore_list_bloc/explore_list_bloc.dart';
import 'package:dogs/features/widget/breed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(26, 25, 22, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DogZone',
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 70),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.searchFill,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColors.searchBorder),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                  child: BlocBuilder<ExploreListBloc, ExploreListState>(
                    builder: (context, state) {
                      if (state.status == ExploreListStatus.error) {
                        return Center(
                          child: Text(
                            'Unable to retrieve Dog List',
                            style: context.textTheme.bodyMedium,
                          ),
                        );
                      }

                      return GridView.builder(
                        itemCount: state.count,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 195,
                        ),
                        itemBuilder: (_, index) {
                          if (state.status == ExploreListStatus.initial) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.grey.shade500,
                              enabled:
                                  state.status == ExploreListStatus.initial,
                              child: Container(
                                color: AppColors.shimmerBg,
                              ),
                            );
                          }

                          return DogItemBox(breedData: state.breedAt(index));
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DogItemBox extends StatelessWidget {
  final BreedDataModel? breedData;
  const DogItemBox({Key? key, required this.breedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (breedData == null) return;
        context.pushNamed('details', pathParameters: {'name': breedData!.name});
      },
      child: Card(
        color: Colors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: NetworkImageBox(url: breedData?.imageUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 3, 0, 0),
              child: Text(
                breedData?.name ?? '',
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 4, 0, 13),
              child: Text('Sub-breed: ${breedData?.subBreedCount ?? ''}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }
}
