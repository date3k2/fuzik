part of '../home.dart';

class MainApp extends StatelessWidget {
  final List<NavigationDestination> items;

  const MainApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              hintText: "Search songs, albums, authors,..."
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: items,
      ),
      body: HomePage()
    );
  }
}