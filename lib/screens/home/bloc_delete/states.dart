
import 'package:task_app/screens/home/bloc_delete/delete_model.dart';

class DeleteStates {}

class DeleteStateStart extends  DeleteStates {}

class DeleteStateSuccess extends  DeleteStates {
  DeleteModel model;
  DeleteStateSuccess({
    required this.model,
});
}

class DeleteStateFailed extends  DeleteStates {
  String mas;
  int errType;
  DeleteStateFailed({
    required this.mas,
    required this.errType,
  });
}