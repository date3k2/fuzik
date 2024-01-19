import 'package:flutter/material.dart';
import 'package:fuzik_app/data/storage.dart';
import 'package:fuzik_app/models/entity/user.dart';
import 'package:fuzik_app/repositories/base.dart';
import 'package:fuzik_app/ultility/interface/information/personal_function.dart';
import 'package:go_router/go_router.dart';

class PersonalController with ChangeNotifier implements IPersonalFunction {
  final BuildContext context;
  User? user;

  PersonalController(this.context);

  @override
  void changeAccount() {
    // TODO: implement changeAccount
  }

  @override
  void information() {
    context.push('/profile', extra: user);
  }

  @override
  void listAlbum() {
    // TODO: implement listAlbum
  }

  @override
  void listMusic() {
    // TODO: implement listMusic
  }

  @override
  void listPlaylists() {
    // TODO: implement listPlaylists
  }

  @override
  void logOut() async {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Đăng xuất"),
      content: const Text("Bạn có chắc muốn đăng xuất"),
      actions: [
        TextButton(onPressed: () async {
          await storage.clear();
          removeToken();
          if (context.mounted) context.go('/login');
        }, child: Text("Đăng xuất", style: TextStyle(color: Theme.of(context).colorScheme.error),)),
        TextButton(onPressed: () {
          context.pop();
        }, child: Text("Thoát")),
      ],
    ));
  }

  @override
  void openStudio() {
    // TODO: implement openStudio
  }
}
