part of '../home.dart';

class MusicianPage extends StatelessWidget {
  static final branch = StatefulShellBranch(
     routes: [route]
  );

  static final route = GoRoute(
      path: '/musician',
      name: 'musician',
      builder: (context, state) => const MusicianPage()
  );

  const MusicianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        //TODO: Implement events
        CarouselSlider(
          items: List.generate(100, (index) => const EventView()),
          options: CarouselOptions(
            height: 200,
            aspectRatio: 3 / 2,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
        ),
        //TODO: Implement Album
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Album", style: Theme.of(context).textTheme.titleLarge),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) => AlbumView(),
              itemCount: 10),
        ),
        //TODO: Implement Playlist
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Playlist", style: Theme.of(context).textTheme.titleLarge),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => PlaylistView(),
              itemCount: 10),
        )
      ],
    );
  }
}