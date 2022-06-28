import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asserts/login2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  right: 35,
                  left: 35,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter valid mail",
                        controller: _emailController,
                        decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 215, 204, 204),
                            filled: true,
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          controller: _passwordController,
                          validator: (value) =>
                              value!.isEmpty ? "Enter some text" : null,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 215, 204, 204),
                              filled: true,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w300),
                          ),
                          CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // ignore: avoid_print
                                    print('form is validated');
                                    Navigator.pushNamed(context, 'homepage');
                                  } else {
                                    // ignore: avoid_print
                                    print('form is not validated');
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'signup');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, 'forgetpasswordpage');
                            },
                            child: const Text(
                              'Forget Password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
