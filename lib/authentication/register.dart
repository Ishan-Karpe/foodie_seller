import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodie_seller/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          InkWell(
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage: imageXFile == null ? null : FileImage(File(imageXFile!.path)),
              child: imageXFile == null ?
              Icon(
                Icons.add_photo_alternate_rounded,
                size: MediaQuery.of(context).size.width * 0.20,
                color: Colors.grey,
              ) : null
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                    data: Icons.person,
                    controller: nameController,
                    hintText: "Name",
                    isObsecure: false,
                ),
                CustomTextField(
                  data: Icons.email_sharp,
                  controller: emailController,
                  hintText: "Email",
                  isObsecure: false,
                ),
                CustomTextField(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: "Password",
                  isObsecure: true,
                ),
                CustomTextField(
                  data: Icons.lock_rounded,
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  isObsecure: true,
                ),
                CustomTextField(
                  data: Icons.phone,
                  controller: phoneController,
                  hintText: "Phone",
                  isObsecure: false,
                ),
                CustomTextField(
                  data: Icons.location_on,
                  controller: locationController,
                  hintText: "Location",
                  isObsecure: false,
                  enabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
