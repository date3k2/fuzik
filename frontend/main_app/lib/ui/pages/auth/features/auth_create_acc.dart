part of 'ui.dart';

class AuthCreateAccountPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: 'otp',
      name: 'register-otp',
      builder: (context, state) => AuthCreateAccountPage()
  );

  const AuthCreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo.png', // Replace with your asset image path
                height: 120.0,
                width: 120.0,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'XÁC THỰC TÀI KHOẢN',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: AppColors.yellow),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Mã OTP đã được gửi vào email của bạn, vui lòng kiểm tra để xác thực.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mã OTP',
                hintText: 'ĐIỀN MÃ OTP',
                prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Handle OTP verification
              },
              child: Center(child: Text('ĐỒNG Ý TẠO TÀI KHOẢN')),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle resend OTP
                  },
                  child: Text(
                    'Gửi lại mã xác thực', style: TextStyle(color: AppColors.yellow),
                  ),
                ),
                Text(
                  'Thời gian hiệu lực: 00:01:30',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
