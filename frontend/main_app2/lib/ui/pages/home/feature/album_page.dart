part of '../home.dart';

class AlbumPage extends StatefulWidget {
  static final branch = StatefulShellBranch(routes: [route]);

  static final route = GoRoute(
      path: '/album',
      name: 'album',
      builder: (context, state) => const AlbumPage());

  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late AlbumController _controller;
  int _reset = 0;

  @override
  void initState() {
    super.initState();
    _controller = AlbumController(context);
    _controller.addListener(() {
      setState(() {
        _reset++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _controller.refresh,
      child: FutureBuilder(
          future: albumRepo.getAllAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Icon(Icons.error),
              );
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            final data = snapshot.requireData;
            return GridView.count(
              crossAxisCount: 2,
              children: data.map((e) => AlbumArtwork(album: e)).toList(),
            );
          }),
    );
  }
}
