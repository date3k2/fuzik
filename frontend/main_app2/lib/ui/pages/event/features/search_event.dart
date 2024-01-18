part of 'ui.dart';

class SearchEventPage extends StatelessWidget {
  // static final GoRoute route = GoRoute(
  //     path: '/register',
  //     name: 'register',
  //     builder: (context, state) => SearchEventPage()
  // );

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
        title: Text('Search Event'),
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
                hintText: 'Where do you want to go?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Join what you love',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: Text(
              'Searching for your favorite event',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          // Horizontal list for album artwork
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                AlbumArtwork(title: 'Event 1', image: 'assets/grainy_day.jpg'),
                AlbumArtwork(title: 'Event 2', image: 'assets/bloom.jpg'),
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
                    title: 'Event 1', image: 'assets/grainy_day.jpg'),
                RecommendationTile(title: 'Event 2', image: 'assets/bloom.jpg'),
                RecommendationTile(
                    title: 'Event 3', image: 'assets/back_to_her_man.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
