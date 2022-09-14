import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/helper/server_gate.dart';
import 'package:task_app/screens/show_product/bloc/events.dart';
import 'package:task_app/screens/show_product/bloc/model.dart';
import 'package:task_app/screens/show_product/bloc/states.dart';

class BlocShowProduct extends Bloc<ShowProductEvents, ShowProductStates> {
  BlocShowProduct() : super(ShowProductStates()) {
    on<ShowProductEventStart>(_getData);
  }

  ServerGate serverGate = ServerGate(); // انشاء عنصر مشترك
  // لتحديد العنصر المراد جلب بياناته عند الضغط عليه يتم تمرير البرميتر الخاص به
  // int? id;
  // لجلب البينات من الapi او قاعدت البينات المستخدمه
  void _getData(
    ShowProductEventStart event,
    Emitter<ShowProductStates> emit,
  ) async {
    emit(ShowProductStateStart());
    CustomResponse response = await serverGate.getFromServer(
      url: 'product/show/${event.id}', // يتم وضع الرابط المراد اظهار محتوياته
    );
    // في حالة جلب البينات اذا كانت صحيحه
    if (response.success) {
      // يتم اضافة المودل اللذي تم انشائه
      ProductsShowModel model =
          ProductsShowModel.fromJson(response.response!.data);
      emit(ShowProductStateSuccess(model: model));
    } else {
      // في حالة اذا كانت البينات خاطءه او يوجد خلل في جلب البينات
      emit(ShowProductStateFailed(
          mas: response.msg, errType: response.errType!));
    }
  }
}
