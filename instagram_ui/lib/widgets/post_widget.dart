import 'package:flutter/material.dart';
import 'package:instagram_ui/model/post_model.dart';
import 'package:instagram_ui/widgets/cachedimage_widget.dart';

class Post extends StatefulWidget {
  const Post({super.key, required this.post});
  final PostModel? post;

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
            
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedImage(
                    imgUrl: widget.post!.userprofile!,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.post!.username}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${widget.post!.location}',
                    style: const TextStyle(
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
          SizedBox(
            width: double.infinity,
            height: 370,
            child: CachedImage(
              imgUrl: widget.post!.postimage,
            ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '${widget.post!.username} : ${widget.post!.description}',
              maxLines: 2,
              textAlign:TextAlign.left,
              
              style:const TextStyle(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
