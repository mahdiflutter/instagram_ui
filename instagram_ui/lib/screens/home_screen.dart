import 'package:flutter/material.dart';
import 'package:instagram_ui/widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            getHeader(),
            getStories(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Post(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding getStories() {
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
            height: 98,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
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
                      child: Image.asset('assets/images/profile.png'),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'mahdi_flutter',
                      style: TextStyle(
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
