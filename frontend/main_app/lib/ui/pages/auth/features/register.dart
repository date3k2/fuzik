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
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Địa chỉ email',
                hintText: 'Nhập email',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Họ và tên',
                hintText: 'Nhập họ và tên',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              menuMaxHeight: 30.h,
              items: <String>['Nam', 'Nữ', 'Khác'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
              decoration: InputDecoration(
                labelText: 'Giới tính',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                hintText: 'Nhập mật khẩu',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Xác nhận mật khẩu',
                hintText: 'Nhập lại mật khẩu',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            OutlinedButton.icon(
              icon: Text('BƯỚC TIẾP THEO'),
              label: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                ///TODO: Handle the submission and validation
              },
            ),
          ],
        ),
      ),
    );
  }
}
