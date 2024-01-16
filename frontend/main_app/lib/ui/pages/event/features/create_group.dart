part of 'ui.dart';

class CreateGroupPage extends StatefulWidget {
  static final GoRoute route = GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => CreateGroupPage()
  );

  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  bool agreeToTerms = false;

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
        title: Text('Create Group'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Placeholder for group image
            Container(
              height: 120,
              color: Colors.grey[300],
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 60,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Text field for group name
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name of group',
              ),
            ),

            SizedBox(height: 16),
// Text field for supporting text
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Supporting text',
              ),
            ),
            SizedBox(height: 16),
// Text field for description
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
// Checkbox for terms and conditions
            CheckboxListTile(
              title: Text(
                  'Tôi đồng ý với Chính sách bảo mật và Điều khoản dịch vụ của Fuzik'),
              value: agreeToTerms,
              onChanged: (bool? value) {
                setState(() {
                  agreeToTerms = value!;
                });
              },
              controlAffinity: ListTileControlAffinity
                  .leading, // Aligns the checkbox to the left
            ),
            Spacer(),
// Save and Cancel buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: agreeToTerms
                        ? () {
// Handle save action
                          }
                        : null,
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color
                    ),
                  ),
                ),
                SizedBox(width: 8), // Spacing between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
// Handle cancel action
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Background color
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
