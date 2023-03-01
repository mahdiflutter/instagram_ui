import 'package:flutter/material.dart';
import 'package:instagram_ui/constants/maincolor.dart';
import 'package:instagram_ui/widgets/formpasswordfield_widget.dart';
import 'package:instagram_ui/widgets/formtextfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  bool userNameHasError = false;
  String userNameError = '';
  TextEditingController passwordController = TextEditingController();
  bool passwordHasError = false;
  String passwordError = '';
  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //icon
            getHeader(),
            //form
            getForm(),
          ],
        ),
      ),
    );
  }

  SliverPadding getHeader() {
    return SliverPadding(
      padding: const EdgeInsets.only(
        right: 97,
        left: 97,
        top: 80,
        bottom: 30,
      ),
      sliver: SliverToBoxAdapter(
        child: Image.asset('assets/images/instalogo.png'),
      ),
    );
  }

  SliverPadding getForm() {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            formTextField(
              controller: userNameController,
              hintText: 'User Name',
              hasError: userNameHasError,
              errorText: userNameError,
            ),
            const SizedBox(
              height: 30,
            ),
            FormPasswordField(
              controller: passwordController,
              hintText: 'Password',
              hasError: passwordHasError,
              errorText: passwordError,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Forgot Password?',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: MainColors.mainBlueTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 44,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.facebook,
                  color: MainColors.mainBlueTextColor,
                  size: 40,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Log in with Facebook',
                  style: TextStyle(
                    color: MainColors.mainBlueTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xff000000).withOpacity(0.4),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: const Color(0xff000000).withOpacity(0.4),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0xff000000).withOpacity(0.4),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: const Color(0xff000000).withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  "Sign up .",
                  style: TextStyle(
                    color: MainColors.mainBlueTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Instagram from Meta",
              style: TextStyle(
                color: const Color(0xff000000).withOpacity(0.4),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
