part of 'ui.dart';

class PersonalDrawer extends StatefulWidget {
  const PersonalDrawer({super.key});

  @override
  State<PersonalDrawer> createState() => _PersonalDrawerState();
}

class _PersonalDrawerState extends State<PersonalDrawer> {
  late final PersonalController controller;

  @override
  void initState() {
    super.initState();
    controller = PersonalController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
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
            menuItem('THÔNG TIN CÁ NHÂN', icon: Icons.person, onTap: controller.information),
            menuItem('BÀI HÁT', icon: Icons.music_note, onTap: controller.listMusic),
            menuItem('DANH SÁCH PHÁT', icon: Icons.playlist_play, onTap: controller.listPlaylists),
            menuItem('ALBUM', icon: Icons.album, onTap: controller.listAlbum),
            menuItem('CÔNG TY/STUDIO', icon: Icons.business, onTap: controller.openStudio),
            menuItem('THIẾT LẬP TÀI KHOẢN', icon: Icons.settings, onTap: controller.changeAccount),
            menuItem('ĐĂNG XUẤT', icon: Icons.logout, onTap: controller.logOut),
          ],
        ),
    );
  }

  Widget menuItem(String title, {String? note, IconData? icon, void Function()? onTap}) {
    return ListTile(
      onTap: onTap ?? () {},
      leading: Icon(icon ?? Icons.music_note),
      title: Text(title),
      subtitle: note == null? null: Text(note),
    );
  }
}
