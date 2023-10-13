import 'package:bloc/bloc.dart';
import 'package:bloc_counter/pages/register/bloc/sign_up_event.dart';
import 'package:bloc_counter/pages/register/bloc/sign_up_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<SignUpEvent>((event, emit) {
      if(event is UserNameEvent) {
      _userNameEvent(event, emit);
      } else if (event is EmailEvent){
        _emailEvent(event, emit);
      } else if (event is PasswordEvent) {
        _passwordEvent( event , emit);
      } else if (event is ConfirmPasswordEvent) {
        _confirmPassword(event, emit);
      }
    });
  }

  void _userNameEvent(UserNameEvent userNameEvent, Emitter<SignUpState> emit){
    emit(state.copyWith(userName: userNameEvent.userName));
  }

  void _emailEvent(EmailEvent emailEvent, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: emailEvent.email));
  }

  void _passwordEvent(PasswordEvent passwordEvent, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: passwordEvent.password));
  }

  void _confirmPassword(ConfirmPasswordEvent confirmPasswordEvent, Emitter<SignUpState> emit) {
    emit(state.copyWith(confirmPassword: confirmPasswordEvent.confirmPassword));
  }
}
