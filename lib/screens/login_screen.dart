import 'package:flutter/material.dart';
import 'package:worthy/screens/home_screen.dart';
import 'package:worthy/services/login_service.dart';
import 'package:worthy/utils/alert.dart';
import 'package:worthy/utils/nav.dart';
import 'package:worthy/widgets/custom_form_field.dart';
import 'package:worthy/widgets/custom_ink_well.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusPassword = FocusNode();
  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF162313),
       backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 100),
            child: Row(
              mainAxisAlignment : MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/wallet_1_lightgreen.png",
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Worthy',
                style: TextStyle(
                  color: Color(0xFF9CFF7B),
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18, ),
          const Padding( padding: EdgeInsets.only(top: 50),),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    label: "Email",
                    validator: _formValidator,
                    textInputType: TextInputType.emailAddress,
                    nextFocus: _focusPassword,
                  ),
                  const SizedBox(height: 30,),
                  CustomTextFormField(
                    controller: _passController,
                    label: "Password",
                    obscureText: true,
                    validator: _formValidator,
                    focusNode: _focusPassword,
                  ),
                  const SizedBox(height: 25,),
                  _showProgress ?
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF9CFF7B)),
                      ),
                    ) :
                    _buildSignInButton(_onSignIn),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: Color(0xFF837E93),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 2.5,),
                      CustomInkWell(label: 'Sign Up', onTap: _signUp),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  CustomInkWell(label: 'Forget Password?', onTap: _forgotPassword),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton(void Function() onTap) {
    return
      ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        width: 329,
        height: 56,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CA237),
          ),
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _onSignIn() async {
    bool _validForm = _formKey.currentState!.validate();
    if(! _validForm) return;

    String login = _emailController.text;
    String psswd = _passController.text;
    print("Login: $login : Password: $psswd");


    setState(() {
      _showProgress = true;
    });

    if (await LoginService.login(login, psswd)) {
      pushReplacement(context, const HomeScreen());
    } else {
      alert(context, 'Login Incorreto');
    }

    setState(() {
      _showProgress = false;
    });
  }

  void _signUp() {
    widget.controller.animateToPage(1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease);
  }

  void _forgotPassword() {
    widget.controller.animateToPage(1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease);
  }

  String? _formValidator(String? text) {
    if(text == null || text.isEmpty) {
      return 'Please input a valid information';
    }
    return null;
  }
}


