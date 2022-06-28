import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({Key? key}) : super(key: key);

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  final _formkey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneNumberController = TextEditingController();

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
              padding: const EdgeInsets.only(left: 35, top: 50),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                  right: 35,
                  left: 35,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? "Enter Your First Name" : null,
                        controller: _firstNameController,
                        decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 215, 204, 204),
                            filled: true,
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? "Enter Your Last Name" : null,
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 215, 204, 204),
                              filled: true,
                              hintText: 'Last Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please Enter Valid Mail",
                          controller: _emailController,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 215, 204, 204),
                              filled: true,
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? "Enter Your Phone Number" : null,
                          controller: _phoneNumberController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(255, 215, 204, 204),
                              filled: true,
                              hintText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          validator: (value) =>
                              value!.isEmpty ? "Enter Valid Password" : null,
                          controller: _passwordController,
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
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w300),
                          ),
                          CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    // ignore: avoid_print
                                    print('Form Is Validated');
                                    Navigator.pushNamed(context, 'login');
                                  } else {
                                    // ignore: avoid_print
                                    print('Form is Not Validated');
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
