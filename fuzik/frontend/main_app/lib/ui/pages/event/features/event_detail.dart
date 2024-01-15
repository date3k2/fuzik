part of 'ui.dart';

class EventDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Detail Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
// This would be the image container
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder color
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              height: 200,
              child: Icon(
                Icons.image, // Placeholder icon
                size: 128,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tên sự kiện',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Địa điểm'),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Ngày công diễn'),
              subtitle: Text('01/01/2024 - 07/01/2024'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Thời gian diễn ra'),
              subtitle: Text('07:00 - 10:00'),
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number),
              title: Text('Số lượng vé'),
              subtitle: Text('999999'),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Mô tả'),
              subtitle: Text('Mô tả về sự kiện'),
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Ban tổ chức'),
              subtitle: Text('Tên nghệ sĩ'),
            ),
            Spacer(), // Pushes the button to the bottom of the screen
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close, size: 32),
                  color: Colors.grey,
                  onPressed: () {
// Handle the close button press
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  ),
                  onPressed: () {
// TODO: Insert event to handle when 'MUA VÉ' is pressed
                  },
                  child: Text(
                    'MUA VÉ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
