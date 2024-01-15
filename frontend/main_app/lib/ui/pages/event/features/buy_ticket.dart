part of 'ui.dart';

class BuyTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Ticket Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.pink.shade200, // Placeholder for an event image
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              // Placeholder icon, replace with actual event image
              child: Icon(Icons.event, size: 100, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              'Tên sự kiện',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Ngày công diễn'),
              subtitle: Text('24/12/2023 - 26/12/2023'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Thời gian diễn ra'),
              subtitle: Text('20:00 - 22:00'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Địa điểm'),
              subtitle: Text('ĐẠI HỌC BÁCH KHOA HÀ NỘI'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Số lượng',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'CÒN LẠI: 1000 VÉ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('THÀNH TIỀN'),
              subtitle: Text('3.600.000 VND'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Button color
                onPrimary: Colors.white, // Text color
              ),
              onPressed: () {
// TODO: Implement payment confirmation logic
              },
              child: Text('XÁC NHẬN THANH TOÁN'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
// TODO: Handle cancel action
              },
              child: Text('HỦY', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
