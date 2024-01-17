part of 'ui.dart';

class RegisterPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterPage(),
      routes: [AuthCreateAccountPage.route]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16.0), child: RegisterForm()),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> key = GlobalKey();
  late final RegisterController _controller;

  @override
  void initState() {
    _controller = RegisterController(key);
    _controller.init(context);
    _controller.addListener(() {
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      "TẠO TÀI KHOẢN MỚI",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: AppColors.yellow),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    TextFormField(
                      controller: _controller.emailController,
                      validator: _controller.validateEmail,
                      decoration: InputDecoration(
                        labelText: 'Địa chỉ email',
                        hintText: 'Nhập email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _controller.nameController,
                      validator: _controller.validateName,
                      decoration: InputDecoration(
                        labelText: 'Họ và tên',
                        hintText: 'Nhập họ và tên',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<int>(
                      validator: _controller.validateGender,
                      menuMaxHeight: 30.h,
                      items: _controller.genderMap.keys.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                              _controller.genderMap.values.elementAt(value)),
                        );
                      }).toList(),
                      onChanged: _controller.changeGender,
                      decoration: InputDecoration(
                        labelText: 'Giới tính',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                        controller: _controller.passwordController,
                        validator: _controller.validatePassword,
                        decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            hintText: 'Nhập mật khẩu',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(_controller.isShowPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: _controller.setPasswordShow,
                            )),
                        obscureText: !_controller.isShowPassword),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _controller.retypeController,
                      validator: _controller.validateRetypePassword,
                      decoration: InputDecoration(
                          labelText: 'Xác nhận mật khẩu',
                          hintText: 'Nhập lại mật khẩu',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_controller.isShowRetypePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: _controller.setRetypePasswordShow,
                          )),
                      obscureText: !_controller.isShowRetypePassword,
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Bằng việc nhấn tiếp tục, bạn đồng ý với Điều khoản sử dụng và Chính sách bảo mật của chúng tôi",
                      textAlign: TextAlign.center,
                    ),
                    OutlinedButton.icon(
                      icon: Text('BƯỚC TIẾP THEO'),
                      label: Icon(Icons.arrow_forward_ios),
                      onPressed: _controller.createAccount,
                    ),
                  ],
                ))));
  }
}
