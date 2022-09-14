

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/helper/server_gate.dart';
import 'package:task_app/screens/home/bloc_delete/delete_model.dart';
import 'package:task_app/screens/home/bloc_delete/events.dart';
import 'package:task_app/screens/home/bloc_delete/states.dart';

class BlocDelete extends Bloc<DeleteEvents, DeleteStates> {
  BlocDelete() : super(DeleteStates()) {
    on<DeleteEventStart>(_deleteProductData);
  }
  ServerGate serverGate = ServerGate();
  // int? id;
  void _deleteProductData(
      DeleteEventStart event,
      Emitter<DeleteStates> emit,
      ) async {
    emit(DeleteStateStart());
    CustomResponse response = await serverGate.deleteFromServer(
      url: 'product/destroy/${event.id}',
    );
    if (response.success) {
      DeleteModel model = DeleteModel.fromJson(response.response!.data);
      emit(DeleteStateSuccess(model: model));
    } else {
      emit(DeleteStateFailed(mas: response.msg, errType: response.errType!));
    }
  }

}