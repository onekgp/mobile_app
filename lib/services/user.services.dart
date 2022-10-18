import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/semantics.dart';
import 'package:onekgp_app/models/ModelProvider.dart';

class UserServices {
  Future<OneKgpUser?> fetchCurrentUser() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    List<OneKgpUser> user =
        await Amplify.DataStore.query(OneKgpUser.classType, where: OneKgpUser.ID.eq(authUser.userId));
    if (user.isNotEmpty) {
      return user.first;
    } else {
      return null;
    }
  }

  Future<bool?> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.name: name,
        // additional attributes as needed
      };
      final result = await Amplify.Auth.signUp(
        username: 'myusername',
        password: 'mysupersecurepassword',
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      return result.isSignUpComplete;
    } on AuthException catch (e) {
      safePrint(e.message);
      return null;
    }
  }

  Future<bool> optVerfication({
    required String email,
    required String password,
    required String otp,
    required String name,
  }) async {
    SignUpResult res = await Amplify.Auth.confirmSignUp(
      username: email,
      confirmationCode: otp,
    );
    if (res.isSignUpComplete) {
      SignInResult signInRes = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      AuthUser authUser = await Amplify.Auth.getCurrentUser();
      Amplify.DataStore.save(
        OneKgpUser(
          email: email,
          name: name,
          id: authUser.userId,
        ),
      );
      return signInRes.isSignedIn;
    }
    return false;
  }

  Future saveUserData() async {
    try {
      AuthUser authUser = await Amplify.Auth.getCurrentUser();
      List<AuthUserAttribute> result = await Amplify.Auth.fetchUserAttributes();
      String? email, name;
      for (final e in result) {
        if (e.userAttributeKey.key == "email") email = e.value;
      }
      if (email != null) {
        Amplify.DataStore.save(
          OneKgpUser(
            email: email,
            name: authUser.username,
            id: authUser.userId,
          ),
        );
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future logout() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (_) {
      rethrow;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    SignInResult res = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );
    return res.isSignedIn;
  }
}
