import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                'assets/images/profile.png',
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'mahdi_flutter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Tokyo , Japan',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/postmenu.png',
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Image.asset(
            'assets/images/post.png',
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image.asset(
                'assets/icons/like.png',
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/icons/comment.png',
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/icons/direct.png',
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/bookmark.png',
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            children: const [
              SizedBox(
                width: 15,
              ),
              Image(
                image: AssetImage("assets/images/profile2.png"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Liked by',
              ),
              Text(
                ' carig_love',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' and 44,860 others',
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'mahdi_flutter The game in Japan was amazing and I want to share some photos',
                  style: TextStyle(
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
