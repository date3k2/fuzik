part of 'ui.dart';

class ForgotPasswordPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/forget-password',
      name: 'forgotPassword',
      builder: (context, state) => ForgotPasswordPage()
  );

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
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
              decoration: InputDecoration(
                labelText: 'Địa chỉ email',
                hintText: 'Nhập email',
                prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Handle the password reset request
              },
              child: Center(child: Text('QUÊN MẬT KHẨU')),
            ),
          ],
        ),
      ),
    );
  }
}
