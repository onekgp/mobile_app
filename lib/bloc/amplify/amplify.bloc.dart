import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onekgp_app/models/OneKgpUser.dart';
import 'package:onekgp_app/services/amplify.services.dart';
import 'package:onekgp_app/services/user.services.dart';

abstract class AmplifyEvent {
  const AmplifyEvent();
}

class Configure extends AmplifyEvent {}

abstract class AmplifyState {
  const AmplifyState();
}

class Configured extends AmplifyState {}

class NotConfigured extends AmplifyState {}

class AmplifyBloc extends Bloc<AmplifyEvent, AmplifyState> {
  final AmplifyServices _amplifyServices = AmplifyServices.instance;
  late final StreamSubscription<HubEvent> hubSubscription;
  OneKgpUser? currUser;
  AmplifyBloc() : super(NotConfigured()) {
    Future configure(Configure c, Emitter<AmplifyState> emit) async {
      emit(NotConfigured());
      (await _amplifyServices.configure()) ? emit(Configured()) : emit(NotConfigured());

      hubSubscription = Amplify.Hub.listen([HubChannel.Auth], (hubEvent) async {
        print("**************HUB***************");

        print(hubEvent.eventName);
        print(hubEvent.payload);
        switch (hubEvent.eventName) {
          case 'SIGNED_IN':
            UserServices().saveUserData();
            break;
          case 'SIGNED_OUT':
            print('USER IS SIGNED OUT');
            break;
          case 'SESSION_EXPIRED':
            print('SESSION HAS EXPIRED');
            break;
          case 'USER_DELETED':
            print('USER HAS BEEN DELETED');
            break;
        }
        print("**************HUB***************");
      });
    }

    on<Configure>(configure);
  }

  @override
  Future<void> close() {
    hubSubscription.cancel();
    return super.close();
  }
}
