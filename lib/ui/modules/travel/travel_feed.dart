import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:onekgp_app/services/amplify.services.dart';

import 'package:onekgp_app/services/time.dart';

import 'package:onekgp_app/main.dart';
import 'package:onekgp_app/models/ModelProvider.dart';
import 'package:onekgp_app/services/theme.services.dart';
import 'package:onekgp_app/services/user.services.dart';

class TravelFeed extends StatefulWidget {
  const TravelFeed({super.key});

  @override
  State<TravelFeed> createState() => _TravelFeedState();
}

class _TravelFeedState extends State<TravelFeed> {
  bool _isLoading = true;

  List<TravelPost> _todos = [];

  late StreamSubscription<QuerySnapshot<TravelPost>> _subscription;

  @override
  void initState() {
    super.initState();

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    _subscription = Amplify.DataStore.observeQuery(TravelPost.classType).listen((QuerySnapshot<TravelPost> snapshot) {
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
      appBar: AppBar(title: Text("Community Kadarla"), actions: [
        Switch(
            value: themeNotifier.themeMode == ThemeMode.dark,
            onChanged: (v) {
              themeNotifier.toggleTheme(v);
              setState(() {});
            }),
      ]),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          UserServices().logout();
        },
      ),
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              for (int i = 0; i < _todos.length; i++) ...[
                TravelCard(
                  travelPost: _todos[i],
                )
              ]
            ],
          )),
    );
  }
}

class TravelCard extends StatefulWidget {
  final TravelPost travelPost;
  const TravelCard({super.key, required this.travelPost});

  @override
  State<TravelCard> createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color(0xffDCDCDC)), borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(11),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 9),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffDCDCDC)), borderRadius: BorderRadius.circular(20)),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.travelPost.id.substring(0, 5),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "123 K Street",
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.more_vert_rounded,
                  color: Color(0xffcdcdcd),
                  size: 30,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: TicketPainter(
                borderColor: Colors.black,
                bgColor: Color.fromARGB(255, 234, 245, 203),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.travelPost.from.name}-${widget.travelPost.to.name}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${widget.travelPost.seats} seats available',
                          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.travelPost.date.getDateTime().toNamedDate(),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Transform.rotate(
                            angle: 2.0,
                            child: Icon(
                              Icons.airplanemode_on_rounded,
                              color: Colors.black54,
                              size: 25,
                            ),
                          ),
                        ),
                        Text(
                          '10:40AM',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                        Text(
                          'Arrival',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.drive_eta_rounded,
                            color: Colors.black54,
                            size: 25,
                          ),
                        ),
                        Text(
                          '10:40AM  -  11:00PM',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Onekgp',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromRGBO(97, 95, 95, .4)),
                        ),
                        Chip(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          label: Text(
                            "Chat",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TicketUi extends StatelessWidget {
  const TicketUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 220,
            margin: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: TicketPainter(
                borderColor: Colors.black,
                bgColor: const Color(0xFFfed966),
              ),
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  final Color borderColor;
  final Color bgColor;

  static const _cornerGap = 20.0;
  static const _cutoutRadius = 20.0;
  static const _cutoutDiameter = _cutoutRadius * 2;

  TicketPainter({required this.bgColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = maxHeight - maxHeight * 0.2;
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = cutoutStartPos - _cutoutRadius;
    double dottedLineStartX = _cutoutRadius;
    final double dottedLineEndX = maxWidth - _cutoutRadius;
    const double dashWidth = 8.5;
    const double dashSpace = 4;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    final paintDottedLine = Paint()
      ..color = borderColor.withOpacity(0.5)
      ..strokeWidth = 1.2;

    var path = Path();

    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }
  }

  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  @override
  bool shouldRepaint(TicketPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => false;
}

class DrawDottedhorizontalline extends CustomPainter {
  late Paint _paint;
  DrawDottedhorizontalline() {
    _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      if (i % 3 == 0) canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
