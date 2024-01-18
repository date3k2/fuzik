part of '../home.dart';

class SongPage extends StatefulWidget {
  static final branch = StatefulShellBranch(routes: [route]);

  static final route = GoRoute(
      path: '/song',
      name: 'song',
      builder: (context, state) => const SongPage());

  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  late final SongController controller;
  late Future _future;

  @override
  void initState() {
    super.initState();
    int _reset = 0;
    controller = SongController(context);
    _future = controller.getSong;
    controller.addListener(() {
      _future = controller.getSong;
      setState(() {
        _reset++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refresh,
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Icon(Icons.error),
              );
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return SafeArea(
              child: ListView.separated(
                  itemCount: snapshot.requireData.length + 1,
                  itemBuilder: (context, index) {
                    if (index == snapshot.requireData.length) {
                      return const SizedBox(
                          height: 100,
                          child: Center(
                              child: Text(
                            "Bạn đã lướt đến cuối danh sách",
                            textAlign: TextAlign.center,
                          )));
                    }
                    return SongTile(
                      song: snapshot.requireData[index],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 2)),
            );
          }),
    );
  }
}
