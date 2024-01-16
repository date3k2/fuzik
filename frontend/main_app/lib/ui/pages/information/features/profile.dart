part of 'ui.dart';

class ProfilePage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => ProfilePage()
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button
          },
        ),
        title: Text('Profile Page'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.pink,
            ),
          ),
          Center(
            child: Text(
              'NGÔ NGỌC SÂM',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Họ và tên'),
            subtitle: Text('Ngô Ngọc Sâm'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('ngosam@gmail.com'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Ngày sinh'),
            subtitle: Text('15/12/2003'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.transgender),
            title: Text('Giới tính'),
            subtitle: Text('Nam'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Quốc tịch'),
            subtitle: Text('Việt Nam'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Ngày tạo'),
            subtitle: Text('02/12/2023'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
              leading: Icon(Icons.lock),
              title: Text('Mật khẩu'),
              subtitle: Text('**********'),
              trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[Icon(Icons.visibility), Icon(Icons.edit)]))
          // ... Additional ListTiles for other profile items
        ],
      ),
    );
  }
}
