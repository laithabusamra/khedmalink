import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/already_have_account_check.dart';
import 'package:khedma_link/constants/widgets/rounded_button.dart';
import 'package:khedma_link/constants/widgets/rounded_input_field.dart';
import 'package:khedma_link/constants/widgets/rounded_password_field.dart';
import 'package:khedma_link/screens/Signup/comonents/background.dart';
import 'package:khedma_link/screens/Signup/comonents/or_divider.dart';
import 'package:khedma_link/screens/Signup/comonents/social_icons.dart';
import 'package:khedma_link/screens/login/login_screen.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.08),
            const Text(
              "SIGN UP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            SizedBox(height: size.height * 0.03),

            // Outer container behind input fields
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F9), //light grey
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ],
              ),
              child: Column(
                children: [
                  RoundedInputField(
                    hintText: "Your Name",
                    icon: Icons.person_outline,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "Your Email",
                    icon: Icons.email_outlined,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "Phone Number",
                    icon: Icons.phone,
                    onChanged: (value) {},
                  ),
                  RoundedInputField(
                    hintText: "Portfolio Link (https://...)",
                    icon: Icons.link,
                    onChanged: (value) {
                      if (!value.startsWith("https://")) {
                        debugPrint("Portfolio link should start with https://");
                      }
                    },
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),

            RoundedButton(
              text: "SIGN UP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
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
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
