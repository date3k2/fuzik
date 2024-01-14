part of 'ui.dart';

class AlbumPage extends StatelessWidget {
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
        title: Text('Album Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            color: Colors.pink.shade200, // Placeholder for album cover
          ),
          Center(
            child: IconButton(
              iconSize: 48.0,
              icon: Icon(Icons.play_circle_fill),
              onPressed: () {
                // Handle play action
              },
            ),
          ),
          ListTile(
            title: Text(
              'Name of Album',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Author'),
                Text('Number of Songs - Year'),
                Text('Some note'),
              ],
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ...List.generate(
              4, (index) => songListItem('Name of Song', 'Name of Artist')),
        ],
      ),
    );
  }

  Widget songListItem(String songName, String artistName) {
    return ListTile(
      leading: Icon(Icons.music_note),
      title: Text(songName),
      subtitle: Text(artistName),
      trailing: Icon(Icons.more_vert),
    );
  }
}
