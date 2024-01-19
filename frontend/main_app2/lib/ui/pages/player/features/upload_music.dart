part of 'ui.dart';

class UploadMusicPage extends StatefulWidget {
  static final GoRoute route = GoRoute(
      path: '/song/upload',
      name: 'upload',
      builder: (context, state) => UploadMusicPage()
  );

  @override
  State<UploadMusicPage> createState() => _UploadMusicPageState();
}

class _UploadMusicPageState extends State<UploadMusicPage> {
  late UploadMusicController controller;

  @override
  void initState() {
    super.initState();
    controller = UploadMusicController();
    controller.init(context);
    controller.addListener(() {setState(() {});});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tải lên'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: controller.cancel,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Placeholder for image upload
              InkWell(
                onTap: controller.setImage,
                child: Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: controller.imageWidget
                ),
              ),
              SizedBox(height: 20),
              // TextField for song name
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tên bài hát',
                ),
              ),
              SizedBox(height: 20),
              // TextField for description
              TextField(
                controller: controller.descriptionController,
                keyboardType: TextInputType.multiline,
                autocorrect: true,
                maxLength: 180,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mô tả',
                ),
                minLines: 3,
                maxLines: 6,
              ),
              SizedBox(height: 20),
              // Placeholder for file upload
              InkWell(
                onTap: controller.setMusicFile,
                child: Container(
                  height: 100,
                  color: Colors.grey[800],
                  child: Center(
                    child: controller.audioWidget
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Row for Save and Cancel buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: controller.upload,
                    child: Text('Save'),
                  ),
                  ElevatedButton(
                    onPressed: controller.cancel,
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
