import 'package:appoinment_app_adv/core/features/signup/data/models/sign_up_request_body.dart';
import 'package:appoinment_app_adv/core/features/signup/data/repos/sign_up_repo.dart';
import 'package:appoinment_app_adv/core/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.signupLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(success: (signupResponse) {
      emit(SignUpState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
