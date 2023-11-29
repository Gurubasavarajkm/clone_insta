import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen.dart';
import 'package:instagram_clone/responsive/responsive_layout.dart';
import 'package:instagram_clone/responsive/webScreen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/utilities.dart';
import 'package:instagram_clone/widgets/Text_field_input.dart';

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
  String res = "Something has occured";
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioeditingController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await PickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        username: _userNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        bio: _bioeditingController.text,
        file: _image!);

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      mounted ? showSnackBar(res, context) : null;
    } else {
      mounted
          ? Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const ResponsiveLayout(
                    webScreenLayout: WebScreen(),
                    mobileScreenLayout: MobileScreen()),
              ),
            )
          : null;
    }
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
                  _image != null
                      ? CircleAvatar(
                          radius: 64, backgroundImage: MemoryImage(_image!))
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://th.bing.com/th/id/OIP.ybB2a0HimX1I-ybBY4pOPwHaHa?pid=ImgDet&rs=1'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {
                        selectImage();
                      },
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
                onTap: () async {
                  signUpUser();
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
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Sign Up'),
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
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      "LogIn",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
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
