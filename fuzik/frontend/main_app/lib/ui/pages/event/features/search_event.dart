part of 'ui.dart';

class SearchEventPage extends StatelessWidget {
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
                EventArtwork(title: 'Event 1', image: 'assets/grainy_day.jpg'),
                EventArtwork(title: 'Event 2', image: 'assets/bloom.jpg'),
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
                RecommendationEvent(
                    title: 'Event 1', image: 'assets/grainy_day.jpg'),
                RecommendationEvent(
                    title: 'Event 2', image: 'assets/bloom.jpg'),
                RecommendationEvent(
                    title: 'Event 3', image: 'assets/back_to_her_man.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for album artwork
class EventArtwork extends StatelessWidget {
  final String title;
  final String image;

  const EventArtwork({Key? key, required this.title, required this.image})
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
class RecommendationEvent extends StatelessWidget {
  final String title;
  final String image;

  const RecommendationEvent(
      {Key? key, required this.title, required this.image})
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
