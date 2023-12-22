part of 'ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        child: Column(children: [
          Center(child: Text('TẠO TÀI KHOẢN MỚI')),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Địa chỉ email", hintText: "Nhập email"),
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Họ và tên", hintText: "Nhập họ và tên"),
          ),
          DropdownButtonFormField(
            items: [],
            onChanged: (value) {},
            decoration: InputDecoration(
                labelText: "Giới tính", hintText: "Chọn giới tính..."),
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: "Mật khẩu", hintText: "Nhập mật khẩu")),
          TextFormField(
              decoration: InputDecoration(
                  labelText: "Xác nhận lại mật khẩu",
                  hintText: "Nhập lại mật khẩu")),
          Row(
            children: [
              Checkbox(value: true, onChanged: (_) {}),
              Text.rich(TextSpan(children: [
                TextSpan(text: 'Tôi đồng ý với '),
                TextSpan(
                    text: 'Chính sách bảo mật',
                    style: TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                TextSpan(text: ' và '),
                TextSpan(
                    text: 'Điều khoản dịch vụ',
                    style: TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                TextSpan(text: ' của Fuzik')
              ]))
            ],
          ),
          FilledButton.tonal(
              onPressed: () {},
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Bước tiếp theo"),
                  WidgetSpan(child: Icon(Icons.arrow_forward_ios))
                ])),
              ))
        ]),
      )),
    );
  }
}
