import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/screens/widgets/custom_alert.dart';
import 'package:ecommerce/screens/widgets/custom_textfield.dart';
import 'package:ecommerce/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    if (await ApiService.isUserLoggedIn()) {
      _navigateToHomeScreen();
    }
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    final bool loggedIn = await ApiService.login(username, password);

    if (loggedIn) {
      _navigateToHomeScreen();
    } else {
      _showErrorDialog();
    }

    setState(() {
      isLoading = false;
    });
  }

  void _navigateToHomeScreen() {
    Get.toNamed(Routes.mainPage);
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          title: "Login Failed!",
          content: "Invalid email or password.",
          buttonText: "OK",
          onPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/shoping.png',
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Welcme Back!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: usernameController,
                        hintText: "Enter Username",
                        prefixIcon: const Icon(Icons.person),
                        obscureText: false,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: passwordController,
                        hintText: "Enter Password",
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(
                            double.infinity,
                            50,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("or", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(
                            double.infinity,
                            50,
                          ),
                        ),
                        child: const Wrap(
                          children: <Widget>[
                            Icon(
                              Icons.g_mobiledata,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("New to logistics?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
