import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                unselectedLabelColor: Colors.black.withOpacity(0.5),
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                tabs: const [
                  Tab(
                    icon: Text(
                      'Following',
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'You',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: [Text('following')],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  SizedBox(
                                    width: 44,
                                    height: 44,
                                    child: Image.asset(
                                      'assets/images/profile.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Wrap(
                                      children: [
                                        const Text(
                                          'Karen_2023 ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text('Liked your photo. '),
                                        Text(
                                          '1h',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width: 44,
                                    height: 44,
                                    child: Image.asset(
                                      'assets/images/post.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
