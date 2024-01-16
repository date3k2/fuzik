part of 'ui.dart';

class PersonalPage extends StatelessWidget {
  // static final GoRoute route = GoRoute(
  //     path: '/register',
  //     name: 'register',
  //     builder: (context, state) => PersonalPage()
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
        title: Text('Personal Page'),
      ),
      body: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Họ và tên'),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: Text('Avatar'), // Placeholder for the user's avatar
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
          menuItem('THÔNG TIN CÁ NHÂN', 'Some note'),
          menuItem('BÀI HÁT', 'Some note'),
          menuItem('DANH SÁCH PHÁT', 'Some note'),
          menuItem('ALBUM', 'Some note'),
          menuItem('CÔNG TY/STUDIO', 'Some note'),
          menuItem('THIẾT LẬP TÀI KHOẢN', 'Some note'),
          menuItem('ĐĂNG XUẤT', 'Some note'),
        ],
      ),
    );
  }

  Widget menuItem(String title, String note) {
    return ListTile(
      leading: Icon(Icons.music_note),
      title: Text(title),
      subtitle: Text(note),
    );
  }
}
