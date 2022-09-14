import 'dart:io';

import 'package:flutter/material.dart';

class StoreProductEvents {}

class StoreProductEventStart extends StoreProductEvents {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final File? image;

  StoreProductEventStart({
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.image,
  });
}
