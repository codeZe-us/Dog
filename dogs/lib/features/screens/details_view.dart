import 'package:dogs/core/utils/extension.dart';
import 'package:dogs/data/data_layer/models/breed_data_model.dart';
import 'package:dogs/features/bloc/details_bloc/breed_details_bloc.dart';
import 'package:dogs/features/widget/box_spacing.dart';
import 'package:dogs/features/widget/breed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsView extends StatefulWidget {
  final BreedDataModel breedDataModel;
  const DetailsView({
    Key? key,
    required this.breedDataModel,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late BreedDataModel breedData;
  bool hasCalledRetrieved = false;

  @override
  void initState() {
    super.initState();
    breedData = widget.breedDataModel;

    BlocProvider.of<BreedDetailsBloc>(context).add(
      RetrieveDetailsEvent(
        widget.breedDataModel.name,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!hasCalledRetrieved) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<BreedDetailsBloc, BreedDetailsState>(
                builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    title: Text(
                      breedData.name,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [StretchMode.zoomBackground],
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          NetworkImageBox(
                            url: breedData.imageUrl,
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                    actions: [
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: Icon(Icons.bookmark_add_outlined),
                      ),
                    ],
                    iconTheme: const IconThemeData(
                      color: Colors.white,
                      size: 28,
                    ),
                    centerTitle: true,
                    expandedHeight: 310,
                    collapsedHeight: kToolbarHeight,
                    backgroundColor: Colors.white,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        children: [
                          const Box.vertical(28),
                          _ThreeImage(images: state.images),
                          const Box.vertical(28),
                          _ItemHeader(
                            headerTitle: 'Description',
                            textList: state.description,
                          ),
                          _ItemHeader(
                            headerTitle: 'Sub breed',
                            textList: breedData.subBreed,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(height: 100),
                  ),
                ],
              );
            }),
          ),
          const _BottomItemButton(),
        ],
      ),
    );
  }
}

class DogImage extends StatelessWidget {
  final url;
  final List<String> images;
  const DogImage({Key? key, this.url, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: NetworkImageBox(url: images.itemAt(0)),
    );
  }
}

class _ThreeImage extends StatelessWidget {
  final List<String> images;
  const _ThreeImage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        imageBox(images.itemAt(0)),
        const Box.vertical(11),
        imageBox(images.itemAt(1)),
        const Box.vertical(11),
        imageBox(images.itemAt(2)),
      ],
    );
  }

  Widget imageBox(String? url) {
    return SizedBox(
      height: 52,
      width: 54,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: NetworkImageBox(url: url),
          ),
        ),
      ),
    );
  }
}

class _ItemHeader extends StatelessWidget {
  final String headerTitle;
  final List<String> textList;

  const _ItemHeader({
    Key? key,
    required this.headerTitle,
    required this.textList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Box.vertical(4),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            headerTitle,
            style: context.textTheme.bodyLarge,
          ),
        ),
        const Box.vertical(6),
        const Divider(),
        const Box.vertical(6),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 0, 20),
          child: Column(
            children: List.generate(textList.length, (i) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Text(
                  textList[i],
                  style: context.textTheme.bodyMedium,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _BottomItemButton extends StatelessWidget {
  const _BottomItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 96,
      color: Colors.orange,
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: GestureDetector(
              onTap: () {
                context.push('/explore/details/affenpinscher');
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    'SAVE BREED',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
