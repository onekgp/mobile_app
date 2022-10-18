import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:onekgp_app/models/ModelProvider.dart';

class TravelDataServices {
  Future<List<TravelPost>> getAllTravelPosts() async {
    return await Amplify.DataStore.query(TravelPost.classType, sortBy: [TravelPost.DATE.descending()]);
  }
}
