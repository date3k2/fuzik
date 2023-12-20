import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:home/home.dart';

void main() {
  runApp(MaterialApp(home: MainApp(items: [
    NavigationDestination(icon: Icon(Icons.home), label: "Trang chủ"),
    NavigationDestination(icon: Icon(Icons.music_note), label: "Nhạc sĩ"),
    NavigationDestination(icon: Icon(Icons.playlist_play), label: "Danh sách phát"),
    NavigationDestination(icon: Icon(Icons.person), label: "Cá nhân"),
  ],),));
}
