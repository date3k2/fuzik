part of 'ui.dart';

class UploadMusicPage extends StatelessWidget {
  // static final GoRoute route = GoRoute(
  //     path: '/register',
  //     name: 'register',
  //     builder: (context, state) => UploadMusicPage()
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
        title: Text('Upload Music Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Placeholder for image upload
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.file_upload, size: 50),
                    Text('choose images of your song'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // TextField for song name
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name of song',
              ),
            ),
            SizedBox(height: 20),
            // TextField for supporting text
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Supporting text',
              ),
            ),
            SizedBox(height: 20),
            // TextField for description
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            // Placeholder for file upload
            Container(
              height: 100,
              color: Colors.grey[800],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.file_upload, size: 50),
                    Text('choose files to upload'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Row for Save and Cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle cancel action
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
