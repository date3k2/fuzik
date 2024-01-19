part of 'ui.dart';

class MusicPlayerPage extends StatelessWidget {
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
        title: Text('Play Music Page'),
      ),
      body: Column(
        children: [
          // Placeholder for the album art and artist info
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'PLAYING FROM ARTIST',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'NAME OF ARTIST',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: Colors.pink[200],
                    height: 150.0,
                    width: 150.0,
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  Text(
                    '2nd',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Controls for the music player
          Container(
            color: Colors.purple[300],
            padding: EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Slider(
                  value: 120, // Current position of the song
                  min: 0,
                  max: 300, // Total length of the song
                  onChanged: (value) {
                    // Handle slider change
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.shuffle),
                      onPressed: () {
                        // Handle shuffle action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      onPressed: () {
                        // Handle skip previous action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () {
                        // Handle play action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      onPressed: () {
                        // Handle skip next action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.repeat),
                      onPressed: () {
                        // Handle repeat action
                      },
                    ),
                  ],
                ),
                // Additional icons for like, playlist add, and download
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Handle like action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.playlist_add),
                      onPressed: () {
                        // Handle add to playlist action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.file_download),
                      onPressed: () {
                        // Handle download action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
