import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_provider.dart';
import 'package:instagram_clone/widgets/Text_field_input.dart';
// import 'package:firebase_core/firebase_core.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioeditingController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioeditingController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Instagram",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: ColorFiltered(
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  child: SvgPicture.asset(
                    'assets/ic_instagram.svg',
                    height: 64,
                  ),
                ),
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.ybB2a0HimX1I-ybBY4pOPwHaHa?pid=ImgDet&rs=1'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              TextFieldInput(
                textEditingController: _userNameController,
                hintText: 'Enter Your Username',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 22,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter Your email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 22,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 22,
              ),
              TextFieldInput(
                textEditingController: _bioeditingController,
                hintText: 'Enter Your bio',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () async{
                  print('Button Clicked');
                  await AuthMethods().signUpUser(
                    username: _userNameController.text, 
                    email: _emailController.text, 
                    password: _passwordController.text, 
                    bio: _bioeditingController.text);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Already have an account?"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      //padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
