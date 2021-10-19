import 'dart:io';
//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccountView extends StatefulWidget {
 const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  File? _imageFile;

  Future selectImage({ImageSource imageSource = ImageSource.camera}) async {
    XFile? selectedFile = await _imagePicker.pickImage(source: imageSource);
    
    setState(() {
      _imageFile = File(selectedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage(
                  'assets/images/person_profile_image.png',
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              TextButton.icon(
                                  onPressed: () => selectImage(
                                      imageSource: ImageSource.camera),
                                  icon: const Icon(UniconsLine.camera),
                                  label: const Text('Select From Camara')),
                              TextButton.icon(
                                  onPressed: () => selectImage(
                                      imageSource: ImageSource.gallery),
                                  icon: const Icon(UniconsLine.picture),
                                  label: const Text('Select From Galary'))
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(UniconsLine.camera),
                label: const Text(
                  "Select Profile Picture",
                  //style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                ),

                //const  SizedBox(hieght: 35)
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  label: Text("Full Name"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                // textCapitalization: TextCapitalization.emailS,
                decoration: const InputDecoration(
                  label: Text("Email Address"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                //textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).buttonTheme.colorScheme!.background),
                child:  Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context)
                    .buttonTheme.colorScheme!.primary ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
