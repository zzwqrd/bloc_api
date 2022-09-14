

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:task_app/helper/server_gate.dart';
import 'package:task_app/screens/store_product/bloc/events.dart';
import 'package:task_app/screens/store_product/bloc/model.dart';
import 'package:task_app/screens/store_product/bloc/states.dart';

class BlocProductsStore extends Bloc<StoreProductEvents, StoreProductStates> {
  BlocProductsStore() : super(StoreProductStates()){
   on<StoreProductEventStart>(_storeData);
  }
  ServerGate serverGate = ServerGate();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController  nameController = TextEditingController();
  TextEditingController  descriptionController = TextEditingController();
  TextEditingController  priceController = TextEditingController();
   File? image ;




  void _storeData(
    StoreProductEventStart event,
    Emitter<StoreProductStates> emit,
  ) async{
    emit(StoreProductStateStart());
    CustomResponse response = await serverGate.sendToServer(
      url: 'product/store',
      body: {
        'name' :event.nameController.text,
        'description' : event.descriptionController.text,
        'price' : event.priceController.text,
       if(event.image!=null) "image":MultipartFile.fromFileSync(event.image!.path, filename: event.image!.path.split('/').last.toString(), contentType: MediaType("image", "png")),
      },
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      }
    );
    if(response.success) {
      ProductsStoreModel model = ProductsStoreModel.fromJson(response.response!.data);
        print("=-=-=image=-=-=-> $event.image");
        print("=-=-=description=-=-=-> ${event.nameController.text}");
      emit(StoreProductStateSuccess(model: model));
    } else {
      emit(StoreProductStateFailed(mas: response.msg, errType: response.errType!));
    }
  }

}
