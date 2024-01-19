part of 'ui.dart';

class LoginPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/login', name: 'login', builder: (context, state) => LoginPage());

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: LoginForm());
    }

}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final LoginController controller;
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = LoginController(key);
    controller.init(context);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 5.h, 20, 5.h),
          constraints: BoxConstraints.tightFor(height: 100.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 10),
            Center(child: Hero(tag:'logo', child: Image.asset('assets/logo.png'))),
              const Spacer(),
            TextFormField(
              controller: controller.usernameController,
              keyboardType: TextInputType.emailAddress,
              validator: controller.validateEmail,
              decoration: InputDecoration(
                labelText: 'Địa chỉ email',
                hintText: 'Nhập email',
              ),
            ),
              const Spacer(),
            TextFormField(
              controller: controller.passwordController,
              obscureText: !controller.isShowPassword,
              validator: controller.validatePassword,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                hintText: 'Nhập mật khẩu',
                suffixIcon: IconButton(
                  icon: Icon(controller.isShowPassword ? Icons.visibility_off: Icons.visibility),
                  onPressed: controller.setShowPassword,
                )
              ),
            ),
              const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: controller.isSaveLogin, onChanged: controller.saveLogin),
                    Text("Lưu thông tin đăng nhập"),
                  ],
                ),
                TextButton(onPressed: controller.forgetPassword, child: Text("Quên mật khẩu?")),
              ],
            ),
              const Spacer(),
            OutlinedButton(
                onPressed: controller.login,
                child: Center(
                  child: Text("Đăng nhập"),
                )),
              const Spacer(),
            OutlinedButton(
                onPressed: controller.createAccount,
                child: Center(
                  child: Text("Tạo tài khoản mới"),
                )),
              const Spacer(flex: 10)
          ]),
        ),
      ));
  }
}
