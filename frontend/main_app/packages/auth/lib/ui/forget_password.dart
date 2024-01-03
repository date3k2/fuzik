part of 'ui.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png', // Replace with your asset image path
              height: 100.0,
              width: 100.0,
            ),
            SizedBox(height: 30),
            Text(
              'QUÊN MẬT KHẨU',
              style: TextStyle(color: Colors.yellow[700], fontSize: 24),
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
                filled: true,
                fillColor: Colors.white,
                hintText: 'Nhập email',
                prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the password reset request
              },
              child: Text('QUÊN MẬT KHẨU'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellow[700],
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                textStyle: TextStyle(fontSize: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
