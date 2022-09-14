import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:task_app/helper/btn.dart';
import 'package:task_app/helper/fluttertoast.dart';
import 'package:task_app/helper/image_picer.dart';
import 'package:task_app/helper/text_form.dart';
import 'package:task_app/screens/home/view.dart';
import 'package:task_app/screens/show_product/view.dart';
import 'package:task_app/screens/store_product/bloc/bloc.dart';
import 'package:task_app/screens/store_product/bloc/events.dart';
import 'package:task_app/screens/store_product/bloc/states.dart';

class StoreProduct extends StatefulWidget {
  @override
  State<StoreProduct> createState() => _StoreProductState();
}

class _StoreProductState extends State<StoreProduct> {
  final bloc = KiwiContainer().resolve<BlocProductsStore>();

  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage({ImageSource? source}) async {
    _pickedFile = await _picker.getImage(source: source!);
    // _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        bloc.image = File(_pickedFile!.path);
        print('No image selected.');
      });
    }
  }

  @override
  void initState() {
    bloc.nameController = TextEditingController();
    bloc.descriptionController = TextEditingController();
    bloc.priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: bloc.formKey,
          child: Column(
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    openImagePicker(
                        context: context,
                        onCameraTapped: () {
                          _pickImage(
                            source: ImageSource.camera,
                          );
                        },
                        onGalleryTapped: () {
                          _pickImage(
                            source: ImageSource.gallery,
                          );
                          print("***************${bloc.image}*******************");
                        });
                  },
                  child: Container(
                    width: 88,
                    height: 88,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: bloc.image != null
                              ? Image.file(
                                  File(bloc.image!.path),
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  'https://elreviewz.com/wp-content/uploads/2021/04/beesline-products-review.jpg',
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(100, 0, 0, 0),
                          ),
                          child: Icon(
                            Icons.camera,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TxtField(
                controller: bloc.nameController,
                validator: (String? val) {
                  if (val!.isEmpty)
                    return 'Product Name';
                  else {
                    return null;
                  }
                },
                onSaved: (o) {
                  bloc.nameController.text = o;
                },
                hintText: 'Product Name',
                enabled: true,
                obscureText: false,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15.h,
              ),
              TxtField(
                controller: bloc.descriptionController,
                validator: (String? val) {
                  if (val!.isEmpty)
                    return 'Product Description';
                  else {
                    return null;
                  }
                },
                onSaved: (o) {
                  bloc.descriptionController.text = o;
                },
                hintText: 'Product Description',
                enabled: true,
                obscureText: false,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15.h,
              ),
              TxtField(
                controller: bloc.priceController,
                validator: (String? val) {
                  if (val!.isEmpty)
                    return 'Product price';
                  else {
                    return null;
                  }
                },
                onSaved: (o) {
                  bloc.priceController.text = o;
                },
                hintText: 'Product price',
                enabled: true,
                obscureText: false,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 20.h,
              ),
              if (bloc.formKey.currentState != null || bloc.image != null)
                BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is StoreProductStateSuccess) {
                      // showMassege(
                      //   text: state.model.message,
                      //   state: ToastStates.SUCCESS,
                      // );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                            (Route<dynamic> route) => false,
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.model.message)));
                      // Navigator.pop(context);
                    } else if (state is StoreProductStateFailed) {
                      showMassege(
                        text: state.mas,
                        state: ToastStates.ERROR,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is StoreProductStateStart) {
                      return const CircularProgressIndicator();
                    } else {
                      return Btn(
                        onTap: () {
                          setState(() {
                            if (bloc.image == null) {
                              showMassege(
                                text: "لم يتم تحديد صوره",
                                state: ToastStates.SUCCESS,
                              );
                            } else {
                              if (!bloc.formKey.currentState!.validate()) {
                                return;
                              } else {
                                bloc.add(
                                  StoreProductEventStart(
                                    nameController: bloc.nameController,
                                    image: bloc.image,
                                    descriptionController: bloc.descriptionController,
                                    priceController: bloc.priceController,
                                  ),
                                );
                              }
                            }
                          });
                        },
                        txt: 'Submit',
                      );
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
