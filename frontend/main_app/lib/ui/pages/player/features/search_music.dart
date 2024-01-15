part of 'ui.dart';

class SearchMusicPage extends StatelessWidget {
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
        title: Text('Search Music'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What do you want to listening?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Play what you love',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: Text(
              'Searching for your favorite songs and artists',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          // Horizontal list for album artwork
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                AlbumArtwork(
                    title: 'Grainy day', image: 'assets/grainy_day.jpg'),
                AlbumArtwork(title: 'Bloom', image: 'assets/bloom.jpg'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'RECOMMENDATIONS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Vertical list for recommendations
          Expanded(
            child: ListView(
              children: <Widget>[
                RecommendationTile(
                    title: 'Grain day', image: 'assets/grainy_day.jpg'),
                RecommendationTile(title: 'Bloom', image: 'assets/bloom.jpg'),
                RecommendationTile(
                    title: 'Back to her man',
                    image: 'assets/back_to_her_man.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for album artwork
class AlbumArtwork extends StatelessWidget {
  final String title;
  final String image;

  const AlbumArtwork({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}

// Custom widget for recommendation list tile
class RecommendationTile extends StatelessWidget {
  final String title;
  final String image;

  const RecommendationTile({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      title: Text(title),
      trailing: Icon(Icons.more_vert),
    );
  }
}
