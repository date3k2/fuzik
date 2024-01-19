import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fuzik_app/repositories/repo.dart';
import 'package:fuzik_app/ui/pages/loading_page.dart';
import 'package:fuzik_app/ultility/interface/player/upload_music_function.dart';
import 'package:go_router/go_router.dart';

class UploadMusicController with ChangeNotifier implements IUploadMusicFunction {
  UploadMusicController();

  BuildContext? context;

  late TextEditingController nameController;
  late TextEditingController descriptionController;

  PlatformFile? image;
  PlatformFile? audio;

  void init(BuildContext context) {
    this.context = context;
    nameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  bool get isValid => [nameController.text, audio].every((e) => e != null);

  Widget get imageWidget {
    if (image == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.file_upload, size: 50),
            Text('Chọn ảnh'),
          ],
        ),
      );
    } else {
      return StreamBuilder(
          stream: image!.readStream,
          builder: (context, snapshot) {
            print(snapshot);
            if (!snapshot.hasData) return ColoredBox(color: Colors.grey);
            return Image.memory(snapshot.requireData as Uint8List);
          });
    }
  }

  Widget get audioWidget {
    if (audio == null) {
      return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.file_upload, size: 50),
        Text('choose files to upload'),
      ],
    );
    } else {
      return Row(
      children: [
        Icon(Icons.music_note, size: 50),
        Expanded(child: Text(audio!.name, softWrap: true)),
        IconButton(onPressed: () {
          audio = null;
          notifyListeners();
        }, icon: Icon(Icons.close))
      ],
    );
    }
  }

  @override
  void cancel() {
    showDialog(context: context!, builder: (context) => AlertDialog(
      title: Text("Rời khỏi"),
      content: Text("Bạn có chắc muốn thoát, các thay đổi của bạn chưa được lưu?"),
      actions: [
        TextButton(onPressed: () {context.pop(); context.pop();}, child: Text("Thoát")),
        TextButton(onPressed: () {context.pop();}, child: Text("Tiếp tục")),
      ],
    ));
  }

  @override
  void setImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Chọn ảnh bìa',
      withReadStream: true,
      type: FileType.image
    );
    if (result != null) {
      image = result.files.first;
      notifyListeners();
    }
  }

  @override
  void setMusicFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Chọn bản nhạc',
        withReadStream: true,
        type: FileType.audio,
    );
    if (result != null) {
      audio = result.files.first;
      notifyListeners();
    }
  }

  @override
  void upload() async {
    if (!isValid) {
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text("Vui lòng điền đủ thông tin tên bản nhạc và tệp bản nhạc")));
      return;
    }
    try {
      Navigator.of(context!).push(LoadingOverlay());
      await songRepo.uploadSong(nameController.text, audio!);
      if (context != null) {
        context?.pop();
        context?.pop();
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text("Đã đăng ${nameController.text}")));
      }
    }
    on String catch (e) {
      context?.pop();
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(e)));
      return;
    }
    catch (e) {
      context?.pop();
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text("Lỗi xảy ra")));
      return;
    }
  }
}
