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
          FutureBuilder(
              future: userRepo.getUserInfo().then((value) {
                controller.user = value;
                return value;
              }),
              builder: (context, snapshot) {
                print(snapshot);
                return UserAccountsDrawerHeader(
                  accountName: Text(snapshot.data?.name ?? "Đang tải"),
                  accountEmail: Text(snapshot.data?.email ?? "Đang tải"),
                  currentAccountPicture: const CircleAvatar(
                      foregroundImage: NetworkImage(
                          'https://cdn.vox-cdn.com/thumbor/WR9hE8wvdM4hfHysXitls9_bCZI=/0x0:1192x795/1400x1400/filters:focal(596x398:597x399)/cdn.vox-cdn.com/uploads/chorus_asset/file/22312759/rickroll_4k.jpg')),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Color(0xFF3D3D3D), BlendMode.darken),
                        fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://media.saodaily.com/storage/files/lethihong/2022/07/30/rick-roll-la-gi-meme-rick-roll_531-004016.jpg'))),
                );
              }),
          menuItem('THÔNG TIN CÁ NHÂN',
              icon: Icons.person, onTap: controller.information),
          menuItem('BÀI HÁT',
              icon: Icons.music_note, onTap: controller.listMusic),
          menuItem('DANH SÁCH PHÁT',
              icon: Icons.playlist_play, onTap: controller.listPlaylists),
          menuItem('ALBUM', icon: Icons.album, onTap: controller.listAlbum),
          menuItem('CÔNG TY/STUDIO',
              icon: Icons.business, onTap: controller.openStudio),
          menuItem('THIẾT LẬP TÀI KHOẢN',
              icon: Icons.settings, onTap: controller.changeAccount),
          menuItem('ĐĂNG XUẤT', icon: Icons.logout, onTap: controller.logOut),
        ],
      ),
    );
  }

  Widget menuItem(String title,
      {String? note, IconData? icon, void Function()? onTap}) {
    return ListTile(
      onTap: onTap ?? () {},
      leading: Icon(icon ?? Icons.music_note),
      title: Text(title),
      subtitle: note == null ? null : Text(note),
    );
  }
}
