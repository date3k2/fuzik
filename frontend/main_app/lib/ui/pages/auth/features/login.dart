part of 'ui.dart';

class LoginPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage()
  );

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        child: Column(children: [
          TextFormField(),
          TextFormField(),
          Row(
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  Text("Lưu thông tin đăng nhập"),
                ],
              ),
              TextButton(onPressed: () {}, child: Text("Quên mật khẩu?")),
            ],
          ),
          FilledButton.tonal(
              onPressed: () {},
              child: Center(
                child: Text("Đăng nhập"),
              )),
          FilledButton.tonal(
              onPressed: () {},
              child: Center(
                child: Text("Tạo tài khoản mới"),
              ))
        ]),
      )),
    );
  }
}
