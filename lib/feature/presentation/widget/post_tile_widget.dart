import 'package:flutter/material.dart';

import '../../../utils/app_style.dart';
import '../../data/post_model.dart';

class PostTileWidget extends StatelessWidget {
  final PostModel? postModel;
  const PostTileWidget({
    super.key,
    required this.postModel,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: AppStyle.boxDecoration,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(postModel?.title ?? "", style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500
          ),),
          Divider(),
          Text(postModel?.body ?? "", style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black87
          ),)
        ],
      ),
    );
  }
}
