part of 'ui.dart';

class PlaylistPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => PlaylistPage()
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
        title: Text('Playlist Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                color: Colors.pink.shade200, // Placeholder for playlist image
              ),
              IconButton(
                icon: Icon(Icons.play_circle_fill, size: 64),
                onPressed: () {
                  // Handle play action
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name of Playlist',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Number of Songs',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Number of songs in the playlist
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Name of Song'),
                  subtitle: Text('Name of Artist'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {
                    // Handle tap on this list item
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
