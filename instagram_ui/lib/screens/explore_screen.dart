import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_ui/bloc/explore/explore_bloc.dart';
import 'package:instagram_ui/bloc/explore/explore_event.dart';
import 'package:instagram_ui/bloc/explore/explore_state.dart';
import 'package:instagram_ui/model/image_model.dart';
import 'package:instagram_ui/widgets/cachedimage_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    BlocProvider.of<ExploreBloc>(context).add(
      ExploreGetDataEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: BlocBuilder<ExploreBloc, ExploreState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              getSearchBox(),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 11),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black.withOpacity(0.4),
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 2,
                              ),
                              child: Center(
                                child: Text(
                                  'Sport',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (state is ExploreInitState) ...[
                SliverToBoxAdapter(
                  child: Row(),
                )
              ],
              if (state is ExploreLoadingState) ...[
                const SliverToBoxAdapter(
                  child: SpinKitRing(
                    color: Colors.black,
                    size: 30.0,
                    lineWidth: 3,
                  ),
                )
              ],
              if (state is ExploreSuccessResponseState) ...[
                state.exploreResponse!.fold(
                  (exploreException) {
                    return SliverToBoxAdapter(
                      child: Text(exploreException),
                    );
                  },
                  (exploreResponse) {
                    return ExploreList(
                      list: exploreResponse,
                    );
                  },
                )
              ]
            ],
          );
        },
      )),
    );
  }

  SliverPadding getSearchBox() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xff878787).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      size: 22,
                      color: const Color(0xff878787).withOpacity(0.9),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color(0xff3c3c43).withOpacity(0.6),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/icons/scanqr.png',
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreList extends StatelessWidget {
  const ExploreList({
    super.key,
    required this.list,
  });
  final List<ImageModel>? list;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(5),
      sliver: SliverGrid(
        
        delegate: SliverChildBuilderDelegate(
          childCount:list!.length,
          (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: CachedImage(imgUrl: list![index].imageUrl)
          ),
        ),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
            QuiltedGridTile(1, 1),
          ],
        ),
      ),
    );
  }
}
