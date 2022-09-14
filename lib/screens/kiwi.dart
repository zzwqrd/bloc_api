


import 'package:kiwi/kiwi.dart';
import 'package:task_app/screens/home/bloc/bloc.dart';
import 'package:task_app/screens/home/bloc_delete/bloc.dart';
import 'package:task_app/screens/search/bloc/bloc.dart';
import 'package:task_app/screens/show_product/bloc/bloc.dart';
import 'package:task_app/screens/store_product/bloc/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => BlocProducts());
  container.registerFactory((c) => BlocProductsStore());
  container.registerFactory((c) => BlocShowProduct());
  container.registerFactory((c) => BlocSearch());
  container.registerFactory((c) => BlocDelete());
}