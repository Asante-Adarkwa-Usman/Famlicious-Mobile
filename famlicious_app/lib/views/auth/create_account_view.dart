import 'dart:io';
//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
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

  final emailRegexp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

//Implementing camera and cropping
  Future selectImage({ImageSource imageSource = ImageSource.camera}) async {
    XFile? selectedFile = await _imagePicker.pickImage(source: imageSource);

    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: selectedFile!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'My Cropper',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    setState(() {
      _imageFile = croppedFile;
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
              // const CircleAvatar(
              //   radius: 56,
              //   backgroundImage: AssetImage(
              //     'assets/images/person_profile_image.png',
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: _imageFile == null
                    ? Image.asset('assets/images/person_profile_image.png',
                        width: 130, height: 130, fit: BoxFit.contain)
                    : Image.file(_imageFile!,
                        width: 130, height: 130, fit: BoxFit.contain),
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
                                  onPressed: () => {
                                        Navigator.pop(context),
                                        selectImage(
                                            imageSource: ImageSource.camera)
                                      },
                                  icon: const Icon(UniconsLine.camera),
                                  label: const Text('Select From Camara')),
                              TextButton.icon(
                                  onPressed: () => {
                                        Navigator.pop(context),
                                        selectImage(
                                            imageSource: ImageSource.camera)
                                      },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Fullname is required';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                // textCapitalization: TextCapitalization.emails,
                decoration: const InputDecoration(
                  label: Text("Email Address"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  if (!emailRegexp.hasMatch(value)) {
                    return 'Email is invalid';
                  }
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 8) {
                    return 'Password should be 8 characters or more';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //implement logic here
                    String name = _nameController.text;
                     String email = _emailController.text;
                      String password= _passwordController.text;
                  } else {
                    //validation failed
                    //Implementation of native codes in flutter so make sure to restart the app
                    Fluttertoast.showToast(
                        msg: "Please check your input field(s)",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                style: TextButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).buttonTheme.colorScheme!.background),
                child: Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color:
                          Theme.of(context).buttonTheme.colorScheme!.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
