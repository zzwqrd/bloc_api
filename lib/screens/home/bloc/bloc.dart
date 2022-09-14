import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:task_app/helper/prefe.dart';
import 'package:task_app/helper/server_gate.dart';
import 'package:task_app/screens/home/bloc/events.dart';
import 'package:task_app/screens/home/bloc/model.dart';
import 'package:task_app/screens/home/bloc/states.dart';

class BlocProducts extends Bloc<ProductsEvents, ProductsStates> {
  ServerGate serverGate = ServerGate();

  double? minPrice, maxPrice;
  bool isFiltered =false;
  List<ProductsData> products = [];
  List<ProductsData>? tempList;

  final refreshController = RefreshController();
  int pageNumber = 1;
  onLoading() {
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.loading);
    print("Loading.............................");

    if (tempList != null) {
      tempList!.clear();
      add(ProductsEventStart());
    }
  }

  onRefresh() {
    refreshController.footerMode!.setValueWithNoNotify(LoadStatus.loading);
    print("Refresh............................");
    pageNumber = 1;
    tempList = null;
    products.clear();
    add(ProductsEventStart());
    refreshController.refreshCompleted();
  }

  BlocProducts() : super(ProductsStates()) {
    on<ProductsEventStart>(_getProductData);
  }

  void _getProductData(
    ProductsEventStart event,
    Emitter<ProductsStates> emit,
  ) async {

    emit(ProductsStateStart());
    CustomResponse response = await serverGate.getFromServer(
      url: 'product/index?page=$pageNumber',
    );
    if (response.success) {
      ProductsModel model = ProductsModel.fromJson(response.response!.data);
      tempList = model.data!.data;
      products.addAll(tempList!);
      if (tempList!.isEmpty) {
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.noMore);
      } else {
        refreshController.footerMode!.setValueWithNoNotify(LoadStatus.canLoading);
        pageNumber++;
      }
      emit(ProductsStateSuccess());
    } else {
      emit(ProductsStateFailed(mas: response.msg, errType: response.errType!));
    }
  }
}
