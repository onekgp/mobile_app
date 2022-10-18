import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onekgp_app/models/ModelProvider.dart';

class TravelDataServices {
  Future<List<TravelModel>> getAllTravelPosts() async {
    return await Amplify.DataStore.query(TravelModel.classType, sortBy: [TravelModel.LEAVINGTIME.descending()]);
  }

  Future<bool> saveTravelPost(TravelModel t) async {
    try {
      await Amplify.DataStore.save(t);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future deleteTravelPost(TravelModel t) async {
    return await Amplify.DataStore.delete(t);
  }
}
