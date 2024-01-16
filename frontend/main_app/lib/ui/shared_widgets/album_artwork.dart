import 'package:flutter/material.dart';

/// Custom widget for album artwork
class AlbumArtwork extends StatelessWidget {
  final String title;
  final String image;

  const AlbumArtwork({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}