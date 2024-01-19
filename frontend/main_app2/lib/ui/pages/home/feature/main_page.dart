part of '../home.dart';

class MainPage extends StatefulWidget {
  static final route = StatefulShellRoute(
      branches: [
        HomePage.branch,
        MusicianPage.branch,
        SongPage.branch,
        AlbumPage.branch
      ],
      builder: (context, state, navigationShell) => navigationShell,
      navigatorContainerBuilder: (context, navigationShell, pages) =>
          MainPage(pages: pages, navigationShell: navigationShell));

  final List<Widget> pages;
  final StatefulNavigationShell navigationShell;

  const MainPage(
      {super.key, required this.pages, required this.navigationShell});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _controller;

  late final List<Widget?> _floatingButtons;
  
  Widget? _floatingButton;

  final _items = [
    const NavigationDestination(icon: Icon(Icons.home), label: "Trang chủ"),
    const NavigationDestination(
        icon: Icon(Icons.headset_mic_rounded), label: "Nghệ sĩ"),
    const NavigationDestination(icon: Icon(Icons.music_note), label: "Bài hát"),
    const NavigationDestination(icon: Icon(Icons.album), label: "Album"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        initialIndex: widget.navigationShell.currentIndex,
        length: widget.pages.length,
        vsync: this);
    _floatingButtons = [
      null,
      null,
      FloatingActionButton(
        onPressed: () => context.push('/song/upload'),
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      )
    ];
    _floatingButton = _floatingButtons.elementAtOrNull(widget.navigationShell.currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener(
      bloc: PlayMusicController.bloc,
      listener: (context, song) => setState(() {}),
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: 'Tìm kiếm',
              hintStyle:
                  TextStyle(color: Theme.of(context).secondaryHeaderColor),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.secondary,
                ))
          ],
        ),
        drawer: PersonalDrawer(),
        floatingActionButton: _floatingButton,
        bottomNavigationBar: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: _switchTab,
          destinations: _items,
        ),
        body: TabBarView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.pages,
        ),
        bottomSheet: PlayMusicController.bottomSheet,
      ),
    );
  }

  void _switchTab(int index) {
    setState(() {
      widget.navigationShell.goBranch(index,
          initialLocation: widget.navigationShell.currentIndex == index);
      _controller.animateTo(index);
      _floatingButton = _floatingButtons.elementAtOrNull(index);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
