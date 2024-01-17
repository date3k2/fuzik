part of 'ui.dart';

class ForgotPasswordPage extends StatefulWidget {
  static final GoRoute route = GoRoute(
      path: '/forget-password',
      name: 'forgotPassword',
      builder: (context, state) => ForgotPasswordPage());

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late ForgetPasswordController controller;
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ForgetPasswordController(key);
    controller.init(context);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'QUÊN MẬT KHẨU',
              style: TextStyle(color: AppColors.yellow, fontSize: 24),
            ),
            SizedBox(height: 20),
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo.png', // Replace with your asset image path
                height: 100.0,
                width: 100.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Mail yêu cầu đặt lại mật khẩu đã được gửi vào email của bạn, vui lòng kiểm tra email',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            TextFormField(
              key: key,
              controller: controller.emailController, validator: controller.validateEmail,
              decoration: InputDecoration(
                labelText: 'Địa chỉ email',
                hintText: 'Nhập email',
                prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: controller.confirm,
              child: Center(child: Text('QUÊN MẬT KHẨU')),
            ),
          ],
        ),
      ),
    );
  }
}
