part of 'ui.dart';

class ProfilePage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => ProfilePage(user: state.extra! as User)
  );

  final User user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text('Thông tin cá nhân'),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 260,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                            colorFilter: ColorFilter.mode(Color(0xFF3D3D3D), BlendMode.darken),
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://media.saodaily.com/storage/files/lethihong/2022/07/30/rick-roll-la-gi-meme-rick-roll_531-004016.jpg'))
                  )),
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                              'https://cdn.vox-cdn.com/thumbor/WR9hE8wvdM4hfHysXitls9_bCZI=/0x0:1192x795/1400x1400/filters:focal(596x398:597x399)/cdn.vox-cdn.com/uploads/chorus_asset/file/22312759/rickroll_4k.jpg')),
                      ),
                    ),
                 ),]
                ),
          ),
          Center(
            child: Text(
              user.name.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Họ và tên'),
            subtitle: Text(user.name),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(user.email),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text('Ngày sinh'),
            subtitle: Text(user.birthDate == null? "Chưa có" : DateFormat.yMd().format(user.birthDate!)),
            trailing: const Icon(Icons.edit),
          ),
          ListTile(
            leading: const Icon(Icons.transgender),
            title: const Text('Giới tính'),
            subtitle: Text(["Nam", "Nữ", "Khác"][Gender.values.indexOf(user.gender)]),
            trailing: const Icon(Icons.edit),
          ),
          const ListTile(
            leading: Icon(Icons.flag),
            title: Text('Quốc tịch'),
            subtitle: Text('Việt Nam'),
            trailing: Icon(Icons.edit),
          ),
          const ListTile(
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
