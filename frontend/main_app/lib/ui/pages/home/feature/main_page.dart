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

  bool _isShowFloatingButton = true;

  final _items = [
    const NavigationDestination(icon: Icon(Icons.home), label: "Trang chủ"),
    const NavigationDestination(
        icon: Icon(Icons.headset_mic_rounded), label: "Nghệ sĩ"),
    const NavigationDestination(icon: Icon(Icons.music_note), label: "Bài hát"),
    const NavigationDestination(
        icon: Icon(Icons.album), label: "Album"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.pages.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: 'Tìm kiếm',
            hintStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Theme.of(context).colorScheme.secondary,))
        ],
      ),
      drawer: Drawer(),
      floatingActionButton: _isShowFloatingButton? FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        foregroundColor: Theme.of(context).colorScheme.background,
        child: Icon(Icons.add),
      ) : null,
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
    );
  }

  void _switchTab(int index) {
    setState(() {
      widget.navigationShell.goBranch(index, initialLocation: widget.navigationShell.currentIndex == index);
      _controller.animateTo(index);
      _isShowFloatingButton = [2, 3].contains(index);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
