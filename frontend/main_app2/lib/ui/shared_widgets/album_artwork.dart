import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/album.dart';

/// Custom widget for album artwork
class AlbumArtwork extends StatelessWidget {
  final Album album;

  const AlbumArtwork({Key? key, required this.album})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP_w0XTGoOeoBvW4aic-v1PBjkc3w9nYIbsw&usqp=CAU'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Text(album.name ?? "Album không có tên"),
          ],
        ),
      ),
    );
  }
}