

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/helper/server_gate.dart';
import 'package:task_app/screens/search/bloc/events.dart';
import 'package:task_app/screens/search/bloc/model.dart';
import 'package:task_app/screens/search/bloc/states.dart';

class BlocSearch extends Bloc<SearchEvents, SearchStates> {
  // BlocSearch(super.initialState);
  ServerGate serverGate = ServerGate();
  BlocSearch() : super(SearchStates()) {
    on<SearchEventStart>(_getSearch);
  }

  String? keyWord;

  void _getSearch(
      SearchEventStart event,
      Emitter<SearchStates> emit,
      ) async{
    emit(SearchStateStart());
    CustomResponse response = await serverGate.getFromServer(
      url: 'product/search/$keyWord',
    );
    if(response.success){
      SearchModel model = SearchModel.fromJson(response.response!.data);
      emit(SearchStateSuccess(model: model));
    }else{
      emit(SearchStateFailed(mas: response.msg, errType: response.errType!));
    }
  }

}