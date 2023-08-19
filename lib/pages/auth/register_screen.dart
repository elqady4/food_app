import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFB7600).withOpacity(0.3),
        iconTheme: IconThemeData.fallback(),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            color: Color(0xFFFB7600).withOpacity(0.2),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: _getFontSize(constraints.maxWidth),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: _getContainerWidth(constraints.maxWidth),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: _getContainerWidth(constraints.maxWidth),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: _getContainerWidth(constraints.maxWidth),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: _getContainerWidth(constraints.maxWidth),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password Again',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Register logic here
                    },
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFCA200),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  double _getFontSize(double maxWidth) {
    if (maxWidth < 600) {
      return 20;
    } else {
      return 24;
    }
  }

  double _getContainerWidth(double maxWidth) {
    if (maxWidth < 600) {
      return maxWidth * 0.8;
    } else {
      return 400;
    }
  }
}
