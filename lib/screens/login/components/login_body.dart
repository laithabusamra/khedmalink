import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/already_have_account_check.dart';
import 'package:khedma_link/constants/widgets/rounded_button.dart';
import 'package:khedma_link/constants/widgets/rounded_input_field.dart';
import 'package:khedma_link/constants/widgets/rounded_password_field.dart';
import 'package:khedma_link/screens/Signup/comonents/or_divider.dart';
import 'package:khedma_link/screens/Signup/comonents/social_icons.dart';
import 'package:khedma_link/screens/Signup/signup_screen.dart';
import 'package:khedma_link/screens/login/components/background.dart';
import 'package:khedma_link/screens/welcome/freelancer_recruiter/freelancer_recruiters_screen.dart';
// import 'package:khedma_link/screens/login/login_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      childe: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.09),
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FreelancerRecruitersScreen();
                    },
                  ),
                );
              },
              // ignore: deprecated_member_use
              color: buttounColor.withOpacity(0.83),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignupScreen();
                    },
                  ),
                );
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: 'assets/images/facebook.png',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'assets/images/google.png',
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
