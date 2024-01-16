part of 'ui.dart';

class AuthCreateAccountPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
      path: '/register/otp',
      name: 'register-otp',
      builder: (context, state) => AuthCreateAccountPage()
  );

  const AuthCreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png', // Replace with your asset image path
              height: 120.0,
              width: 120.0,
            ),
            SizedBox(height: 30),
            Text(
              'XÁC THỰC TÀI KHOẢN',
              style: TextStyle(color: Colors.white, fontSize: 24),
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
                filled: true,
                fillColor: Colors.white,
                hintText: 'ĐIỀN MÃ OTP',
                prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle OTP verification
              },
              child: Text('ĐỒNG Ý TẠO TÀI KHOẢN'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle resend OTP
              },
              child: Text(
                'Gửi lại mã xác thực',
                style: TextStyle(color: Colors.blue[300]),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Thời gian hiệu lực: 00:01:30',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
