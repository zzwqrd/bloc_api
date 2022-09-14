import 'package:task_app/screens/store_product/bloc/model.dart';

class StoreProductStates {}

class StoreProductStateStart extends StoreProductStates {}

class StoreProductStateSuccess extends StoreProductStates {
  ProductsStoreModel model;

  StoreProductStateSuccess({
    required this.model,
  });
}

class StoreProductStateFailed extends StoreProductStates {
  String mas;
  int errType;
  StoreProductStateFailed({
    required this.mas,
    required this.errType,
  });
}
