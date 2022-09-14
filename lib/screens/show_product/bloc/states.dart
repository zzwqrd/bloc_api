import 'package:task_app/screens/show_product/bloc/model.dart';

class ShowProductStates {}

class ShowProductStateStart extends ShowProductStates {}

class ShowProductStateSuccess extends ShowProductStates {
  ProductsShowModel model;

  ShowProductStateSuccess({
    required this.model,
  });
}

class ShowProductStateFailed extends ShowProductStates {
  String mas;
  int errType;

  ShowProductStateFailed({
    required this.mas,
    required this.errType,
  });
}
