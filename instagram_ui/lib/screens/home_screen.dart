import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_ui/bloc/home/home_bloc.dart';
import 'package:instagram_ui/bloc/home/home_event.dart';
import 'package:instagram_ui/bloc/home/home_state.dart';
import 'package:instagram_ui/model/post_model.dart';

import 'package:instagram_ui/model/user_model.dart';
import 'package:instagram_ui/widgets/cachedimage_widget.dart';
import 'package:instagram_ui/widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(
      HomeGetDataEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              getHeader(),
              if (state is HomeInitState) ...[
                SliverToBoxAdapter(
                  child: Row(),
                )
              ],
              if (state is HomeLoadingState) ...[
                const SliverToBoxAdapter(
                  child: SpinKitRing(
                    color: Colors.black,
                    size: 30.0,
                    lineWidth: 3,
                  ),
                )
              ],
              if (state is HomeSuccessResponseState) ...[
                state.storiesResponse.fold(
                  (storiesError) {
                    return SliverToBoxAdapter(
                      child: Text(storiesError),
                    );
                  },
                  (storiesResponse) {
                    return StoriesList(list: storiesResponse);
                  },
                ),
                state.postsResponse.fold(
                  (postsError) {
                    return SliverToBoxAdapter(
                      child: Text(postsError),
                    );
                  },
                  (postsResponse) {
                    return PostList(list: postsResponse);
                  },
                ),
              ],
              
            ],
          );
        },
      )),
    );
  }

  SliverPadding getHeader() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/camera.png',
            ),
            const Spacer(),
            SizedBox(
              height: 20,
              child: Image.asset(
                'assets/images/instalogo.png',
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/direct.png',
            ),
          ],
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key, required this.list});
  final List<PostModel>? list;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list!.length,
        (context, index) {

          return Post(post:list![index],);
        },
      ),
    );
  }
}

class StoriesList extends StatefulWidget {
  const StoriesList({super.key, required this.list});
  final List<UserModel>? list;

  @override
  State<StoriesList> createState() => _StoriesListState();
}

class _StoriesListState extends State<StoriesList> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0XFF000000).withOpacity(0.2),
                width: 1,
              ),
              top: BorderSide(
                color: const Color(0XFF000000).withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: SizedBox(
            height: 115,
            child: ListView.builder(
              itemCount: widget.list!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  top: 8,
                  bottom: 8,
                ),
                child: SizedBox(
                  width: 65,
                  height: 65,
                  child: Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        padding: const EdgeInsets.all(2),
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xffFBAA47),
                              Color(0xffD91A46),
                              Color(0xffA60F93),
                            ],
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: CachedImage(
                            imgUrl: widget.list![index].avatar,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${widget.list![index].username}',
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
