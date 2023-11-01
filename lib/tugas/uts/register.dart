import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:app/tugas/uts/default.dart';

Map<String, List<String>> registration = {
  'firstName': [],
  'lastName': [],
  'mobileNumber': [],
  'email': [],
  'password': [],
  'address': [],
};

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController mobileNumberController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final TextEditingController addressController = TextEditingController();

String? firstNameError;
String? lastNameError;
String? mobileNumberError;
String? emailError;
String? passwordError;
String? confirmPasswordError;
String? addressError;

String? validateRegistrationFirstName() {
  if (firstNameController.text.isEmpty) {
    return 'First name is required';
  } else if (firstNameController.text.length < 3) {
    return 'First name must be at least 3 characters';
  } else {
    firstNameError = null;
    return null;
  }
}

String? validateRegistrationLastName() {
  if (lastNameController.text.isEmpty) {
    return 'Last name is required';
  } else if (lastNameController.text.length < 3) {
    return 'Last name must be at least 3 characters';
  } else {
    lastNameError = null;
    return null;
  }
}

String? validateRegistrationMobileNumber() {
  if (mobileNumberController.text.isEmpty) {
    return 'Mobile number is required';
  } else if (mobileNumberController.text.length < 10) {
    return 'Mobile number must be at least 10 characters';
  } else {
    mobileNumberError = null;
    return null;
  }
}

String? validateRegistrationEmail() {
  if (emailController.text.isEmpty) {
    return 'Email is required';
  } else if (EmailValidator.validate(emailController.text) == false) {
    return 'Invalid email format';
  } else if (registration['email']!.contains(emailController.text)) {
    return 'Email already exists';
  } else {
    emailError = null;
    return null;
  }
}

String? validateRegistrationPassword() {
  if (passwordController.text.isEmpty) {
    return 'Password is required';
  } else if (!RegExp(
          r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}|:<>?~\[\]\/\\-]).{8,}$')
      .hasMatch(passwordController.text)) {
    return 'Password must be min 8 letters, 1 number, 1 symbol';
  } else {
    passwordError = null;
    return null;
  }
}

String? validateRegistrationConfirmPassword() {
  if (confirmPasswordController.text.isEmpty) {
    return 'Confirm password is required';
  } else if (confirmPasswordController.text != passwordController.text) {
    return 'Passwords do not match';
  } else {
    confirmPasswordError = null;
    return null;
  }
}

String? validateRegistrationAddress() {
  if (addressController.text.isEmpty) {
    return 'Address is required';
  } else {
    addressError = null;
    return null;
  }
}

void saveRegistration() {
  registration['firstName'] ??= [];
  registration['firstName']!.add(firstNameController.text);

  registration['lastName'] ??= [];
  registration['lastName']!.add(lastNameController.text);

  registration['mobileNumber'] ??= [];
  registration['mobileNumber']!.add(mobileNumberController.text);

  registration['email'] ??= [];
  registration['email']!.add(emailController.text);

  registration['password'] ??= [];
  registration['password']!.add(passwordController.text);

  registration['address'] ??= [];
  registration['address']!.add(addressController.text);
}

void clearControllersRegistration() {
  firstNameController.clear();
  lastNameController.clear();
  mobileNumberController.clear();
  emailController.clear();
  passwordController.clear();
  confirmPasswordController.clear();
  addressController.clear();
}

final formRegisterKey = GlobalKey<FormState>();

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isRegistrationSuccessful = false;

  void loadingAnimation() async {
    // Set loading to true to show the loading dialog
    setState(() {
      isRegistrationSuccessful = true;
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
      isRegistrationSuccessful = false;
    });

    // Now, show the user info bottom sheet or perform other actions
    showRegistrationBottomSheet();
  }

  void showRegistrationBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: false,
      builder: (context) {
        String latestFirstName = registration['firstName'] != null &&
                registration['firstName']!.isNotEmpty
            ? registration['firstName']!.last
            : 'N/A';
        String latestLastName = registration['lastName'] != null &&
                registration['lastName']!.isNotEmpty
            ? registration['lastName']!.last
            : 'N/A';
        String latestMobileNumber = registration['mobileNumber'] != null &&
                registration['mobileNumber']!.isNotEmpty
            ? registration['mobileNumber']!.last
            : 'N/A';
        String latestEmail =
            registration['email'] != null && registration['email']!.isNotEmpty
                ? registration['email']!.last
                : 'N/A';
        String latestPassword = registration['password'] != null &&
                registration['password']!.isNotEmpty
            ? registration['password']!.last
            : 'N/A';
        String latestAddress = registration['address'] != null &&
                registration['address']!.isNotEmpty
            ? registration['address']!.last
            : 'N/A';

        return Container(
          decoration: const BoxDecoration(
            color: background,
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
                                'Registration Successful!',
                                style: TextStyle(
                                  color: primary,
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
                                          color: primary,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestFirstName,
                                        style: const TextStyle(
                                          color: primary,
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
                                          color: primary,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestLastName,
                                        style: const TextStyle(
                                          color: primary,
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
                                          color: primary,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestMobileNumber,
                                        style: const TextStyle(
                                          color: primary,
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
                                          color: primary,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestEmail,
                                        style: const TextStyle(
                                          color: primary,
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
                                          color: primary,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestPassword,
                                        style: const TextStyle(
                                          color: primary,
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
                                          color: primary,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        latestAddress,
                                        style: const TextStyle(
                                          color: primary,
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
                                      child: Text('Kembali',
                                          style: TextStyle(
                                              color: background,
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
  bool isConfirmPasswordVisible = false;

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
            key: formRegisterKey,
            child: Column(
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: const TextStyle(
                      color: secondary,
                    ),
                    helperText: ' ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: firstNameError != null ? foreground : secondary,
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
                        color: firstNameError != null ? foreground : secondary,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.person_outline, color: foreground),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: background,
                  ),
                  validator: (value) => validateRegistrationFirstName(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: const TextStyle(
                      color: secondary,
                    ),
                    helperText: ' ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: lastNameError != null ? foreground : secondary,
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
                        color: lastNameError != null ? foreground : secondary,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.person_outline, color: foreground),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: background,
                  ),
                  validator: (value) => validateRegistrationLastName(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: mobileNumberController,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle: const TextStyle(
                      color: secondary,
                    ),
                    helperText: ' ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color:
                            mobileNumberError != null ? foreground : secondary,
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
                        color:
                            mobileNumberError != null ? foreground : secondary,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon: const Icon(Icons.phone, color: foreground),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: background,
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    LengthLimitingTextInputFormatter(
                        12), // Limit to 12 characters
                  ],
                  validator: (value) => validateRegistrationMobileNumber(),
                ),
                const SizedBox(height: 10.0),
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
                    color: background,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => validateRegistrationEmail(),
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
                    color: background,
                  ),
                  validator: (value) => validateRegistrationPassword(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                      color: secondary,
                    ),
                    helperText: ' ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: confirmPasswordError != null
                            ? foreground
                            : secondary,
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
                        color: confirmPasswordError != null
                            ? foreground
                            : secondary,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.lock_outline, color: foreground),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                      child: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: foreground,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: background,
                  ),
                  validator: (value) => validateRegistrationConfirmPassword(),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: const TextStyle(
                      color: secondary,
                    ),
                    helperText: ' ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: addressError != null ? foreground : secondary,
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
                        color: addressError != null ? foreground : secondary,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    prefixIcon: const Icon(Icons.location_on_outlined,
                        color: foreground),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: background,
                  ),
                  validator: (value) => validateRegistrationAddress(),
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
                    if (formRegisterKey.currentState!.validate()) {
                      loadingAnimation();
                      saveRegistration();
                      clearControllersRegistration();
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
                    child: Text('Register',
                        style: TextStyle(
                            color: primary, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }
}
