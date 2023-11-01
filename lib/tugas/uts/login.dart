import 'package:flutter/material.dart';
import 'package:app/tugas/uts/default.dart';
import 'package:app/tugas/uts/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Map<String, String> login = {
  'firstName': '',
  'lastName': '',
  'mobileNumber': '',
  'email': '',
  'password': '',
  'address': '',
};

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

String? emailError;
String? passwordError;

String? validateLoginEmail() {
  if (emailController.text.isEmpty) {
    return 'Email is required';
  } else if (EmailValidator.validate(emailController.text) == false) {
    return 'Invalid email format';
  }

  if (registration['email'] != null && registration['email']!.isNotEmpty) {
    if (registration['email']!.first != emailController.text) {
      return 'Email is incorrect';
    }
  } else {
    return 'Email is incorrect';
  }

  emailError = null;
  return null;
}

String? validateLoginPassword() {
  if (passwordController.text.isEmpty) {
    return 'Password is required';
  }

  if (registration['password'] != null &&
      registration['password']!.isNotEmpty) {
    if (registration['password']!.first != passwordController.text) {
      return 'Password is incorrect';
    }
  } else {
    return 'Password is incorrect';
  }

  passwordError = null;
  return null;
}

void clearControllersLogin() {
  emailController.clear();
  passwordController.clear();
}

void saveLogin() {
  if (registration['email']?.first == emailController.text &&
      registration['password']?.first == passwordController.text) {
    login['firstName'] = registration['firstName']?.first ?? '';
    login['lastName'] = registration['lastName']?.first ?? '';
    login['mobileNumber'] = registration['mobileNumber']?.first ?? '';
    login['email'] = registration['email']?.first ?? '';
    login['password'] = registration['password']?.first ?? '';
    login['address'] = registration['address']?.first ?? '';
  }
}

void resetLogin() {
  login['firstName'] = '';
  login['lastName'] = '';
  login['mobileNumber'] = '';
  login['email'] = '';
  login['password'] = '';
  login['address'] = '';
}

final formLoginKey = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isLoginSuccessful = false;

  void loadingAnimation() async {
    // Set loading to true to show the loading dialog
    setState(() {
      isLoginSuccessful = true;
    });

    // Show the custom loading dialog with a transparent background
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Set background to transparent
          elevation: 0,
          child: Center(
            child: LoadingAnimationWidget.dotsTriangle(
              color: foreground,
              size: 35,
            ),
          ),
        );
      },
    );

    // Delay for 10 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Close the loading dialog
    Navigator.of(context).pop();

    // Set loading to false
    setState(() {
      isLoginSuccessful = false;
    });

    // Now, show the user info bottom sheet or perform other actions
    showLoginBottomSheet();
  }

  void showLoginBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      builder: (context) {
        String latestFirstName =
            login['firstName'] != null && login['firstName']!.isNotEmpty
                ? login['firstName']!
                : 'N/A';
        String latestLastName =
            login['lastName'] != null && login['lastName']!.isNotEmpty
                ? login['lastName']!
                : 'N/A';
        String latestMobileNumber =
            login['mobileNumber'] != null && login['mobileNumber']!.isNotEmpty
                ? login['mobileNumber']!
                : 'N/A';
        String latestEmail =
            login['email'] != null && login['email']!.isNotEmpty
                ? login['email']!
                : 'N/A';
        String latestPassword =
            login['password'] != null && login['password']!.isNotEmpty
                ? login['password']!
                : 'N/A';
        String latestAddress =
            login['address'] != null && login['address']!.isNotEmpty
                ? login['address']!
                : 'N/A';

        return Container(
          decoration: const BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Text(
                                'Login Successful!',
                                style: TextStyle(
                                  color: background,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person_outline,
                                  color: foreground,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'First Name',
                                        style: TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestFirstName,
                                        style: const TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person_outline,
                                  color: foreground,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Last Name',
                                        style: TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestLastName,
                                        style: const TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: foreground,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Mobile Number',
                                        style: TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestMobileNumber,
                                        style: const TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline,
                                  color: foreground,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Email',
                                        style: TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestEmail,
                                        style: const TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.lock_outline,
                                  color: foreground,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Password',
                                        style: TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestPassword,
                                        style: const TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: foreground,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Address',
                                        style: TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestAddress,
                                        style: const TextStyle(
                                          color: background,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      resetLogin();
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: foreground,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      child: Text('Logout',
                                          style: TextStyle(
                                              color: primary,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: Image(
            image: AssetImage('images/icon_64px.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.12,
              vertical: 5.0),
          child: Form(
            key: formLoginKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: secondary,
                    ),
                    helperText: ' ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: emailError != null ? foreground : secondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: foreground,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: emailError != null ? foreground : secondary,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.mail_outline, color: foreground),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: primary,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => validateLoginEmail(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: secondary,
                    ),
                    helperText: ' ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: passwordError != null ? foreground : secondary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: foreground,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: passwordError != null ? foreground : secondary,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.lock_outline, color: foreground),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: foreground,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: primary,
                  ),
                  validator: (value) => validateLoginPassword(),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.12,
                    vertical: 25.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formLoginKey.currentState!.validate()) {
                      loadingAnimation();
                      saveLogin();
                      clearControllersLogin();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: foreground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text('Login',
                        style: TextStyle(
                            color: background, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
