import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/rounded_button.dart';
import 'package:khedma_link/navigation_menu.dart';
import 'package:khedma_link/screens/recruite_page/recruiter_home_screen.dart';
import 'package:khedma_link/screens/welcome/components/background.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'WELCOME TO KHEDMA LINK',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            Image.asset(
              'assets/images/khedmaLink.png',
              height: 299,
              width: 300,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
                text: "Freelancer",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const NavigationMenu();
                      },
                    ),
                  );
                }),
            RoundedButton(
              text: "Recruiter",
              color: secondeButtounColor2,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RecruiterHomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
