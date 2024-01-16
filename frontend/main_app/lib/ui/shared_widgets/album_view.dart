import 'package:flutter/material.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  //TODO: Ghép model Album
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //Layer 0: Event background
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //Layer 1: Details
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      color: Colors.white54
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Tên album", style: Theme.of(context).textTheme.titleMedium,),
                      Text("Tên nhạc sĩ", style: Theme.of(context).textTheme.bodySmall,)
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}