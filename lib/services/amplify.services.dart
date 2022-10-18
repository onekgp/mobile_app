import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onekgp_app/amplifyconfiguration.dart';
import 'package:onekgp_app/models/ModelProvider.dart';

class AmplifyServices {
  AmplifyServices._constructor();

  static final _instance = AmplifyServices._constructor();

  static AmplifyServices get instance => _instance;

  factory AmplifyServices() => _instance;

  Future<bool> configure() async {
    try {
      final amplifyDataStore = AmplifyDataStore(modelProvider: ModelProvider.instance);

      final AmplifyAPI apiPlugin = AmplifyAPI();
      final AmplifyAuthCognito authPlugin = AmplifyAuthCognito();

      await Amplify.addPlugins([amplifyDataStore, apiPlugin, authPlugin]);
      await Amplify.configure(amplifyconfig);

      debugPrint("**************CONFIUGURING***************");

      return true;
    } on Exception catch (e) {
      debugPrint('Error configuring Amplify: $e');
      return false;
    }
  }
}
