import 'package:task_app/screens/home/bloc/model.dart';

class ProductsStates {}

class ProductsStateStart extends ProductsStates {}

class ProductsStateSuccess extends ProductsStates {
  // List<ProductsData> model = [];
  // ProductsStateSuccess({
  //   required this.model,
  // });
}

class ProductsStateFailed extends ProductsStates {
  String mas;
  int errType;
  ProductsStateFailed({
    required this.mas,
    required this.errType,
  });
}

class AppThemeModeStatesChange extends ProductsStates {}
