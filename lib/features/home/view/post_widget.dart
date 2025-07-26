import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/core/dialog/loading_dialog.dart';

import '../domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white38,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10,),
              Text(post.userName, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222222),
              )
              )
            ],
          ),
          SizedBox(height: 20,),
          if (post.imageUrl != null) ...[
            CachedNetworkImage(
              imageUrl: post.imageUrl!,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
              const Center(child: Loading()),
              errorWidget: (context, url, error) =>
              const Icon(Icons.broken_image),
            ),
            SizedBox(height: 20,),
            Text(post.userName, style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF222222),
            )
            )
          ],

        ],
      ),
    );
  }
}
