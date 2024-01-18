import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_1/common/widgets/flutter_toasts.dart';

import 'bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: "You need to fill password ");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: "You need to verify your email account ");
            return;
          }

          var user = credential.user;
          if(user!=null){
            //
            print("user exist");
          } else{
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found'){
            print("No user found for that email.");
            toastInfo(msg: "No user found for that email.");
          } else if(e.code == 'wrong-password'){
            print("Wrong password provided for that user.");
            toastInfo(msg: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email'){
            print("Your email format is wrong");
            toastInfo(msg: "Your email format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}