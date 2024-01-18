import 'package:flutter/material.dart';

/// Custom widget for recommendation list tile
class RecommendationTile extends StatelessWidget {
  final String title;
  final String image;

  const RecommendationTile({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      title: Text(title),
      trailing: Icon(Icons.more_vert),
    );
  }
}
