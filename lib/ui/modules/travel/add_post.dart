import 'dart:math';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:onekgp_app/bloc/amplify/amplify.bloc.dart';
import 'package:onekgp_app/models/Location.dart';
import 'package:onekgp_app/models/OneKgpUser.dart';
import 'package:onekgp_app/models/TravelModel.dart';
import 'package:onekgp_app/services/amplify.services.dart';
import 'package:onekgp_app/services/modules/travel.services.dart';
import 'package:onekgp_app/services/navigator.services.dart';
import 'package:onekgp_app/services/time.dart';
import 'package:onekgp_app/services/user.services.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';

class AddTravelPost extends StatefulWidget {
  const AddTravelPost({super.key});

  @override
  State<AddTravelPost> createState() => _AddTravelPostState();
}

class _AddTravelPostState extends State<AddTravelPost> {
  Location from = Location.KGP, to = Location.CCU;
  DateTime seletedDate = DateTime.now();
  TimeOfDay seletedTime = TimeOfDay.now();
  int seats = 3;
  bool isCabBooked = false;
  TextEditingController desc = TextEditingController();

  late OneKgpUser? user;

  @override
  void initState() {
    user = BlocProvider.of<AmplifyBloc>(context).currUser;
    super.initState();
  }

  void savePost() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    user = await UserServices().fetchCurrentUser();
    print(DateTime(seletedDate.year, seletedDate.month, seletedDate.day, seletedTime.hour, seletedTime.minute));
    print(TemporalDateTime(
        DateTime(seletedDate.year, seletedDate.month, seletedDate.day, seletedTime.hour, seletedTime.minute)));
    // if (user != null) {
    //   bool success = await TravelDataServices().saveTravelPost(TravelModel(
    //       from: from,
    //       to: to,
    //       description: desc.text.trim(),
    //       seats: seats,
    //       isCabBooked: isCabBooked,
    //       leavingTime: TemporalDateTime(
    //           DateTime(seletedDate.year, seletedDate.month, seletedDate.day, seletedTime.hour, seletedTime.minute)),
    //       user: user!,
    //       travelModelUserId: user!.id));

    //   if (success) {
    //     NavigatorServices.instance.pop();
    //     const snackBar = SnackBar(
    //       content: Text(
    //         'Post successfully added.',
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       backgroundColor: Color.fromARGB(255, 52, 142, 55),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   } else {
    //     final snackBar = SnackBar(
    //       content: const Text(
    //         'Something went wrong!',
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       backgroundColor: Color.fromARGB(255, 194, 57, 47),
    //       action: SnackBarAction(
    //         label: 'Try again',
    //         textColor: Colors.white,
    //         onPressed: () {
    //           savePost();
    //         },
    //       ),
    //     );

    //     // Find the ScaffoldMessenger in the widget tree
    //     // and use it to show a SnackBar.
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create a Post",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(label: Text("Add Post"), onPressed: () => savePost()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month_rounded),
                        SizedBox(width: 14.toWidth),
                        Text(
                          seletedDate.toNamedDate(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Date",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
                        ),
                      ],
                    )),
                onTap: () async {
                  seletedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 30))) ??
                      DateTime.now();
                  setState(() {});
                },
              ),
              SizedBox(height: 20.toHeight),
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                    child: Row(
                      children: [
                        Icon(Icons.alarm_on_rounded),
                        SizedBox(width: 14.toWidth),
                        Text(
                          seletedTime.hour.toString() + ":" + seletedTime.minute.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Est. leaving time",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
                        ),
                      ],
                    )),
                onTap: () async {
                  seletedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now()) ?? TimeOfDay.now();
                  setState(() {});
                },
              ),
              SizedBox(height: 20.toHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                    child: PopupMenuButton<Location>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xFFEFEEEE),
                      enabled: true,
                      padding: EdgeInsets.all(10),
                      position: PopupMenuPosition.under,
                      onSelected: (value) {
                        setState(() {
                          from = value;
                        });
                      },
                      itemBuilder: (context) {
                        return [
                          for (int i = 0; i < Location.values.length; i++) ...[
                            menuItem(i),
                          ]
                        ];
                      },
                      child: Container(
                        margin: EdgeInsets.all(9),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_pin),
                            SizedBox(width: 5.toWidth),
                            Text(
                              (from ?? Location.KGP).name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20.toWidth),
                            Text(
                              "From",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                    child: PopupMenuButton<Location>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xFFEFEEEE),
                      enabled: true,
                      padding: EdgeInsets.all(10),
                      position: PopupMenuPosition.under,
                      onSelected: (value) {
                        setState(() {
                          to = value;
                        });
                      },
                      itemBuilder: (context) {
                        return [
                          for (int i = 0; i < Location.values.length; i++) ...[
                            menuItem(i),
                          ]
                        ];
                      },
                      child: Container(
                        margin: EdgeInsets.all(9),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_pin),
                            SizedBox(width: 5.toWidth),
                            Text(
                              (to ?? Location.CCU).name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20.toWidth),
                            Text(
                              "To",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.toHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (seats > 0) {
                                setState(() {
                                  seats = max(0, seats - 1);
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove_circle_rounded,
                              size: 27.toFont,
                              color: seats <= 0 ? Colors.grey : null,
                            ),
                          ),
                          SizedBox(width: 14.toWidth),
                          Text(
                            seats.toString(),
                            style: TextStyle(fontSize: 16.toFont),
                          ),
                          SizedBox(width: 16.toWidth),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                seats = min(10, seats + 1);
                              });
                            },
                            child: Icon(
                              Icons.add_circle_rounded,
                              size: 27.toFont,
                              color: seats >= 10 ? Colors.grey : null,
                            ),
                          )
                        ],
                      )),
                  GestureDetector(
                    onTap: () {
                      print("dsjfhskfjdsk");
                      setState(() {
                        isCabBooked = !isCabBooked;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IgnorePointer(
                              child: Checkbox(
                                onChanged: ((value) {}),
                                activeColor: Colors.black,
                                splashRadius: 10,
                                value: isCabBooked,
                              ),
                            ),
                            SizedBox(width: 4.toWidth),
                            Text(
                              "Cab Booked",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 4.toWidth),
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20.toHeight),
              Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                  child: TextField(
                    controller: desc,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: "Description \ne.g: Flight leaves at 12:00pm",
                        hintStyle: TextStyle(color: Colors.black26)),
                    maxLines: 4,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget required() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        "  * required",
        style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 194, 57, 47)),
      ),
    );
  }
}

PopupMenuItem<Location> menuItem(int index) {
  return PopupMenuItem(
    height: 30,
    value: Location.values[index],
    child: Row(
      children: [
        Text(Location.values[index].name),
      ],
    ),
  );
}
