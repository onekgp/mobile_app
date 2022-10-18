import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:onekgp_app/services/amplify.services.dart';
import 'package:onekgp_app/services/modules/travel.services.dart';
import 'package:onekgp_app/services/navigator.services.dart';
import 'package:onekgp_app/services/route.services.dart';

import 'package:onekgp_app/services/time.dart';

import 'package:onekgp_app/main.dart';
import 'package:onekgp_app/models/ModelProvider.dart';
import 'package:onekgp_app/services/theme.services.dart';
import 'package:onekgp_app/services/user.services.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';

class TravelFeed extends StatefulWidget {
  const TravelFeed({super.key});

  @override
  State<TravelFeed> createState() => _TravelFeedState();
}

class _TravelFeedState extends State<TravelFeed> {
  bool _isLoading = true;

  List<TravelModel> _todos = [];

  late StreamSubscription<QuerySnapshot<TravelModel>> _subscription;

  @override
  void initState() {
    super.initState();

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    _subscription =
        Amplify.DataStore.observeQuery(TravelModel.classType, sortBy: [TravelModel.LEAVINGTIME.descending()])
            .listen((QuerySnapshot<TravelModel> snapshot) {
      setState(() {
        print(snapshot.items);
        if (_isLoading) _isLoading = false;
        _todos = snapshot.items;
      });
    });

    // after configuring Amplify, update loading ui state to loaded state
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Travel",
          style: Theme.of(context).textTheme.headline6,
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          NavigatorServices.instance.push(RouteServices.travel_add);
        },
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: GestureDetector(
              onLongPress: () => TravelDataServices().deleteTravelPost(_todos[index]),
              child: TravelCardNew(
                travelPost: _todos[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TravelCardNew extends StatefulWidget {
  final TravelModel travelPost;
  const TravelCardNew({super.key, required this.travelPost});

  @override
  State<TravelCardNew> createState() => _TravelCardNewState();
}

class _TravelCardNewState extends State<TravelCardNew> {
  @override
  Widget build(BuildContext context) {
    bool closed = widget.travelPost.leavingTime.getDateTimeInUtc().compareTo(DateTime.now()) < 0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Color(0xFFEFEEEE),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      widget.travelPost.leavingTime.getDateTimeInUtc().toLocal().toTime(),
                      style: TextStyle(fontSize: 18.toFont, fontWeight: FontWeight.w800),
                    ),
                    // Text(
                    //   "(approx)",
                    //   style: TextStyle(fontSize: 12.toFont, fontWeight: FontWeight.w500),
                    // ),
                  ],
                ),
                SizedBox(width: 15.toWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          size: 12.toWidth,
                        ),
                        SizedBox(width: 15.toWidth),
                        Text(
                          widget.travelPost.from.name,
                          style: TextStyle(fontSize: 18.toFont, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.5),
                      width: 1.2.toHeight,
                      height: 22.toWidth,
                      color: Colors.black54,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          size: 12.toWidth,
                        ),
                        SizedBox(width: 15.toWidth),
                        Text(
                          widget.travelPost.to.name,
                          style: TextStyle(fontSize: 18.toFont, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  widget.travelPost.leavingTime.getDateTimeInUtc().toLocal().toNamedDate(),
                  style: TextStyle(fontSize: 12.toFont, fontWeight: FontWeight.w800, color: Colors.black54),
                )
              ],
            ),
            SizedBox(height: 7.toHeight),
            if ((widget.travelPost.description ?? "").trim().isNotEmpty)
              Text(
                widget.travelPost.description ?? "",
                style: TextStyle(fontSize: 12.6.toFont, color: Colors.black),
              ),
            SizedBox(height: 6.toHeight),
            const Divider(),
            SizedBox(height: 6.toHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20.toWidth,
                ),
                SizedBox(width: 10.toWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sai Chandan",
                      style: TextStyle(fontSize: 14.toFont, fontWeight: FontWeight.w800),
                    ),
                    Row(
                      children: [
                        widget.travelPost.isCabBooked ?? false
                            ? Text("Cab booked ",
                                style: TextStyle(
                                  fontSize: 12.toFont,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 52, 142, 55),
                                ))
                            : const SizedBox.shrink(),
                        if ((widget.travelPost.seats != null && (widget.travelPost.seats! > 0)))
                          Text(
                            (widget.travelPost.isCabBooked ?? false ? "- " : "") +
                                widget.travelPost.seats.toString() +
                                ((widget.travelPost.seats! >= 1) ? " seats" : " seat"),
                            style: TextStyle(fontSize: 12.toFont, fontWeight: FontWeight.w600, color: Colors.black54),
                          ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Chip(
                    padding: EdgeInsets.all(5),
                    backgroundColor: closed ? Color.fromARGB(255, 194, 57, 47) : Color.fromARGB(255, 52, 142, 55),
                    label: Text(
                      closed ? "Closed" : "Chat",
                      style: TextStyle(fontSize: 12.toFont, fontWeight: FontWeight.w400, color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
