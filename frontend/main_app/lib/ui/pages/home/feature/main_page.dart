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

  final _items = [
    const NavigationDestination(icon: Icon(Icons.home), label: "Trang chủ"),
    const NavigationDestination(
        icon: Icon(Icons.notifications), label: "Nghệ sĩ"),
    const NavigationDestination(icon: Icon(Icons.tab), label: "Bài hát"),
    const NavigationDestination(
        icon: Icon(Icons.account_circle), label: "Album"),
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
      widget.navigationShell.goBranch(index);
      _controller.animateTo(index);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
