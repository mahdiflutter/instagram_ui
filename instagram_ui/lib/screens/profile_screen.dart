import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_ui/bloc/profile/profile_bloc.dart';
import 'package:instagram_ui/bloc/profile/profile_event.dart';
import 'package:instagram_ui/bloc/profile/profile_state.dart';
import 'package:instagram_ui/constants/maincolor.dart';
import 'package:instagram_ui/model/image_model.dart';
import 'package:instagram_ui/model/profile_model.dart';
import 'package:instagram_ui/widgets/cachedimage_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(
      ProfileGetDataEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (state is ProfileLodingState) ...[
                const SliverToBoxAdapter(
                  child: SpinKitRing(
                    color: Colors.black,
                    size: 30.0,
                    lineWidth: 3,
                  ),
                )
              ],
              if (state is ProfileSuccessResponseState) ...[
                state.profileInformation!.fold(
                  (profileError) {
                    return SliverToBoxAdapter(
                      child: Text(profileError),
                    );
                  },
                  (profileResponse) {
                    return UserProfile(
                      profile: profileResponse,
                    );
                  },
                ),
                state.userPosts!.fold(
                  (postsError) {
                    return SliverToBoxAdapter(
                      child: Text(postsError),
                    );
                  },
                  (postsResponse) {
                    return UserPosts(
                      list: postsResponse,
                    );
                  },
                )
              ],
            ],
          );
        },
      )),
    );
  }
}

class UserPosts extends StatelessWidget {
  final List<ImageModel>? list;
  const UserPosts({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,

      ),
      itemBuilder: (context, index) {

        return CachedImage(imgUrl:list![index].imageUrl);
      
      },
    itemCount: list!.length,
    );
  }
}

class UserProfile extends StatelessWidget {
  final ProfileModel? profile;
  const UserProfile({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 20,
        right: 15,
        left: 15,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                const Icon(
                  Icons.lock,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${profile!.userName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/profilemenu.png',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 65,
                  height: 65,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: CachedImage(imgUrl: profile!.userProfileUrl)),
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${profile!.userPosts}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      "Posts",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${profile!.userFollowers}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      "Followers",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${profile!.userFollowing}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const Text(
                      "Following",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Text(
                  '${profile!.userName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${profile!.userBio}',
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 34,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(
                      0.4,
                    ),
                  ),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const HistoryWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xffC7C7CC), width: 1),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'New',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
