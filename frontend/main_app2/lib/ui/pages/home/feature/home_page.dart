part of '../home.dart';

class HomePage extends StatefulWidget {
  static final branch = StatefulShellBranch(routes: [route]);

  static final route = GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      redirect: (context, state) async {
        String? token = storage.getString('access_token');
        if (token == null) return '/login';
        addAuth(token);
        return null;
      });

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;
  int _reset = 0;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(context);
    _controller.addListener(() {
      setState(() {_reset++;});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _controller.refresh,
      child: FutureBuilder(
          future: _controller.getNecessaryInfo,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Icon(Icons.error),
              );
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView(
              padding: const EdgeInsets.all(10),
              children: [
                CarouselSlider(
                  items: List.generate(
                      snapshot.requireData.concerts.length,
                      (index) => ConcertView(
                            concert: snapshot.requireData.concerts[index],
                          )),
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 3 / 2,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Album",
                        style: Theme.of(context).textTheme.titleLarge),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          AlbumView(album: snapshot.requireData.albums[index]),
                      itemCount: snapshot.requireData.albums.length),
                ),
                //TODO: Implement Playlist
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Danh sách phát",
                        style: Theme.of(context).textTheme.titleLarge),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => PlaylistView(playlist: snapshot.requireData.playlists[index]),
                      itemCount: snapshot.requireData.playlists.length),
                )
              ],
            );
          }),
    );
  }
}
