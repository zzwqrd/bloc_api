import 'package:task_app/screens/search/bloc/model.dart';

class SearchStates {}

class SearchStateStart extends SearchStates {}

class SearchStateSuccess extends SearchStates {
  SearchModel model;
  SearchStateSuccess({
    required this.model,
});
}

class SearchStateFailed extends SearchStates {
  String mas;
  int errType;
  SearchStateFailed({
    required this.mas,
    required this.errType,
  });
}
