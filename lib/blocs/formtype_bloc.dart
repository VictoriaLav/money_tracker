import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/form_type.dart';
import '../models/states/formtype_state.dart';
import 'events/formtype_event.dart';

class FormTypeBloc extends Bloc<FormTypeEvent, FormTypeState> {
  FormTypeBloc() : super(SignIn()) {
    on<FormTypeRequested>((event, emit) async {
      if (event.formType == FormType.signIn) {
        emit(SignUp());
      } else {
        emit(SignIn());
      }
    });
  }
}
