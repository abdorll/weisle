// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/customer/notificationService/notoficationService.dart';
import 'package:weisle/customer/sign_in.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/header.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    var now = int.parse(DateFormat('kk').format(time));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Header(),
              const YMargin(10),
              SideSpace(
                10,
                0,
                Row(
                  children: [
                    Card(
                      elevation: 10,
                      shadowColor: litePink2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90)),
                      child: CircleAvatar(
                        backgroundColor: white,
                        radius: 30,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOf(
                            now <= 0
                                ? 'Good morning 💭'
                                : (now > 12) && (now <= 16)
                                    ? 'Good afernoon 🌤️'
                                    : (now > 16) && (now < 20)
                                        ? 'Good evening 🌕'
                                        : "Good night 🌒",
                            13,
                            FontWeight.w500,
                            ash),
                        const YMargin(5),
                        Consumer<SignInProvider>(
                            builder: ((context, value, child) {
                          return TextOf(
                              value.fullName, 16, FontWeight.w500, black);
                        })),
                      ],
                    )
                  ],
                ),
              ),
              SideSpace(
                10,
                0,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        navigate(context, Tracker());
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 90,
                            backgroundImage:
                                AssetImage("assets/images/lagos_map.png"),
                          ),
                          Positioned(
                            left: 1,
                            bottom: 1,
                            top: 1,
                            right: 1,
                            child: SpinKitRipple(
                              color: colorPrimary,
                              size: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const XMargin(5),
                    Column(children: [const YMargin(100), DaysChart()])
                  ],
                ),
              ),
              SideSpace(
                10,
                0,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      TextOf('Activity', 20, FontWeight.w500, black)
                    ]),
                    const YMargin(10),
                    SideSpace(
                      10,
                      0,
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        primary: false,
                        childAspectRatio: 0.95,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: [
                          activity(robbery, 50, 'Robbery'),
                          activity(flood_icon, 50, 'Flood'),
                          activity(accident, 50, 'Accident'),
                          activity(traffic_light, 50, 'Traffic'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  oneActivity(index, color) {
    setState(() {
      current = index;
    });
  }
}

class DaysChart extends StatelessWidget {
  const DaysChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextOf('Mon', 13, FontWeight.w600, black),
            IconOf(Icons.sort, black, 15)
          ],
        ),
        const XMargin(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextOf('Tue', 13, FontWeight.w600, black),
            IconOf(Icons.sort, black, 15)
          ],
        ),
        const XMargin(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextOf('Wed', 13, FontWeight.w600, black),
            IconOf(Icons.sort, black, 15)
          ],
        ),
        const XMargin(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextOf('Thu', 13, FontWeight.w600, black),
            IconOf(Icons.sort, black, 15)
          ],
        ),
        const XMargin(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextOf('Fri...', 13, FontWeight.w600, black),
            IconOf(Icons.sort, black, 15)
          ],
        ),
      ],
    );
  }
}

Widget activity(String icon, double height, String text) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: height,
          ),
          const XMargin(4),
          TextOfDecoration(text, 17, FontWeight.w500, ash, TextAlign.center)
        ],
      ),
    ),
  );
}

//////--------------------------------------------------------------------TRACKER REPORT----------
//////--------------------------------------------------------------------TRACKER REPORT----------
//////--------------------------------------------------------------------TRACKER REPORT----------
//////--------------------------------------------------------------------TRACKER REPORT----------
//////--------------------------------------------------------------------TRACKER REPORT-----------------
//////--------------------------------------------------------------------TRACKER REPORT-----------------
class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  String location = 'Searching...';
  String address = 'Searching...';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Placemark? plaemarkPlace;
  Position? locationOnLongLat;
  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    address =
        '${place.street}, ${place.subAdministrativeArea}, ${place.locality}, ${place.country}';
    setState(() {
      plaemarkPlace = place;
    });
  }

  int current = 0;

  Future getMapDetails() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    setState(() {
      locationOnLongLat = position;
    });
    getAddressFromLatLong(position);
  }

  @override
  void initState() {
    getMapDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<NotificationServiceProvider>(
              builder: ((context, value, child) {
            Future.delayed(Duration(seconds: 5), () {
              value.setemergencyCity =
                  plaemarkPlace!.subAdministrativeArea.toString();
              value.setemergencyState = plaemarkPlace!.locality.toString();
              value.setemergencyCountry = plaemarkPlace!.country.toString();
              value.setlongitude = locationOnLongLat!.longitude.toString();
              value.setlatitude = locationOnLongLat!.latitude.toString();
              value.setfullAddress = address;
            });

            //       _emergencyState == null ||
            // _emergencyCity == null ||
            // _longitude == null ||
            // _fullAddress == null ||
            // _emergencyCountry == null ||
            // _latitude == null
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const YMargin(10),
                Header(),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SideSpace(
                          10,
                          0,
                          TextOfDecoration(address, 18, FontWeight.w300, white,
                              TextAlign.left)),
                      SideSpace(
                          10,
                          0,
                          TextOfDecoration(location, 18, FontWeight.w300, white,
                              TextAlign.left)),
                    ],
                  ),
                  decoration: BoxDecoration(color: colorPrimary),
                ),
                Image.asset("assets/images/lagos_map.png",
                    height: 190, width: double.infinity),
                Container(
                  child: SideSpace(
                      10,
                      10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumSizeButton(
                              () {},
                              IconOf(Icons.whatshot, white, 25),
                              colorPrimary,
                              10,
                              40,
                              10,
                              0),
                          MediumSizeButton(
                              () {},
                              IconOf(Icons.emoji_objects, white, 25),
                              colorPrimary,
                              10,
                              40,
                              10,
                              0),
                          MediumSizeButton(
                              () {},
                              IconOf(Icons.share_rounded, white, 25),
                              colorPrimary,
                              10,
                              40,
                              10,
                              0),
                        ],
                      )),
                  decoration: BoxDecoration(color: lightPink),
                ),
                const YMargin(20),
                SideSpace(
                  10,
                  0,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        child: MediumSizeButton(
                            () {},
                            Row(
                              children: [
                                TextOf('Active', 20, FontWeight.w400,
                                    colorPrimary),
                                const XMargin(10),
                                IconOf(
                                    Icons.done_all_rounded, colorPrimary, 20),
                              ],
                            ),
                            white,
                            10,
                            30,
                            15,
                            0),
                      ),
                      Card(
                        child: MediumSizeButton(
                            () {},
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextOf('Disable', 20, FontWeight.w400, ash),
                                const XMargin(10),
                                IconOf(Icons.alarm_off_rounded, ash, 20),
                              ],
                            ),
                            white,
                            10,
                            30,
                            15,
                            0),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const YMargin(20),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconOf(Icons.security_rounded, black, 20),
                              const XMargin(10),
                              TextOf('No threat detected', 20, FontWeight.w400,
                                  black),
                            ],
                          ),
                          const YMargin(30),
                          TextOf(
                              'No threat was identified in your \n current location',
                              20,
                              FontWeight.w500,
                              colorPrimary),
                          const YMargin(30),
                          SideSpace(
                            20,
                            0,
                            MediumSizeButton(
                                () {},
                                InkWell(
                                    onTap: () {
                                      value.notoficationService(context);
                                    },
                                    child: TextOf(
                                        'Report', 20, FontWeight.w400, white)),
                                colorPrimary,
                                15,
                                60,
                                10,
                                0),
                          ),
                          const YMargin(10),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          })),
        ),
      ),
    );
  }

  oneActivity(index, color) {
    setState(() {
      current = index;
    });
  }
}

///--------------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
//////-----------------------------------------------------MAKE A REPORT PAGE; USERS SUBMIT REPORT
class MakeReport extends StatefulWidget {
  const MakeReport({Key? key}) : super(key: key);

  @override
  _MakeReportState createState() => _MakeReportState();
}

class _MakeReportState extends State<MakeReport> {
  List item = [
    'All type',
    'All type',
    'All type',
    'All type',
    'All type',
  ];

  String dropdownvalue = 'All type';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SideSpace(
          20,
          10,
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOf('Current report', 22, FontWeight.w600, black),
                        TextOf('Popular reports', 17, FontWeight.w400, black)
                      ],
                    ),
                  ],
                ),
                const YMargin(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 6.0,
                      child: SideSpace(
                          10,
                          10,
                          Column(
                            children: [
                              IconOf(Icons.view_array_sharp, colorPrimary, 20),
                              const YMargin(10),
                              TextOf('Medical', 18, FontWeight.w600, ash)
                            ],
                          )),
                    ),
                    Card(
                      elevation: 6.0,
                      child: SideSpace(
                          10,
                          10,
                          Column(
                            children: [
                              IconOf(Icons.charging_station_rounded,
                                  colorPrimary, 20),
                              const YMargin(10),
                              TextOf('Robbery', 18, FontWeight.w600, ash)
                            ],
                          )),
                    ),
                    Card(
                      elevation: 6.0,
                      child: SideSpace(
                          10,
                          10,
                          Column(
                            children: [
                              IconOf(
                                  Icons.construction_rounded, colorPrimary, 20),
                              const YMargin(10),
                              TextOf('Assault', 18, FontWeight.w600, ash)
                            ],
                          )),
                    ),
                  ],
                ),
                const YMargin(20),
                InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      width: double.infinity,
                      child: SideSpace(
                        10,
                        15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextOf('Alert type', 15, FontWeight.w300, black),
                            IconOf(Icons.arrow_drop_down_rounded, ash, 20)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const YMargin(10),
                InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      width: double.infinity,
                      child: SideSpace(
                        10,
                        15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextOf('Location', 15, FontWeight.w300, black),
                            IconOf(Icons.arrow_drop_down_rounded, ash, 20)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const YMargin(10),
                InkWell(
                  onTap: () {},
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const XMargin(10),
                              IconOf(Icons.date_range_rounded, ash, 20),
                              const XMargin(10),
                              TextOf('Date', 15, FontWeight.w300, black)
                            ],
                          ),
                          InkWell(
                            child: Container(
                              height: 70,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: colorPrimary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const XMargin(1),
                                  IconOf(Icons.arrow_downward_rounded,
                                      colorPrimary, 20),
                                  TextOf('Today', 20, FontWeight.w400, white),
                                  IconOf(
                                      Icons.arrow_drop_down_rounded, white, 20),
                                  const XMargin(1),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: 10,
                  //textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: GoogleFonts.poppins(
                        color: ash,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(70)))),
                ),
                const YMargin(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MediumSizeButton(
                        () {},
                        Center(
                          child: TextOf(
                              'Cancle', 20, FontWeight.w400, colorPrimary),
                        ),
                        white,
                        10,
                        30,
                        15,
                        3.0),
                    InkWell(
                      onTap: () {
                        navigate(context, UsersReport());
                      },
                      child: MediumSizeButton(
                          () {},
                          Center(
                            child: TextOf('Send', 20, FontWeight.w400, white),
                          ),
                          colorPrimary,
                          10,
                          30,
                          15,
                          3.0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT---------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
//--------------------------------------------------------------USERS REPORT----------------------------
class UsersReport extends StatefulWidget {
  const UsersReport({Key? key}) : super(key: key);

  @override
  _UsersReportState createState() => _UsersReportState();
}

class _UsersReportState extends State<UsersReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SideSpace(
                  10,
                  10,
                  WeisleAppBar(
                      '',
                      Row(
                        children: [
                          TextOf('Users Report', 23, FontWeight.w400, white),
                          const XMargin(3),
                          IconOf(Icons.copy_all_rounded, white, 23)
                        ],
                      ),
                      white)),
              decoration: BoxDecoration(color: colorPrimary),
            ),
            const YMargin(30),
            TextOf('For more details call emrgency number', 15, FontWeight.w300,
                colorPrimary),
            const XMargin(10),
            Container(
              decoration: BoxDecoration(color: white),
              child: SideSpace(
                15,
                10,
                EachReports(
                    Icons.work_outline_rounded,
                    orange,
                    green1,
                    '18 Medical emergencies reported aound Opebi Allen.',
                    'Medical',
                    () {}),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: white),
              child: SideSpace(
                15,
                10,
                EachReports(
                    Icons.group_add_outlined,
                    green1,
                    ash,
                    'No reports made of kidnapping as of today.',
                    'Kidnap',
                    () {}),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: white),
              child: SideSpace(
                15,
                10,
                EachReports(
                    Icons.security_rounded,
                    green1,
                    ash,
                    '4 Burglary cases reported along Oregun Ikeja',
                    'Robbery',
                    () {}),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: white),
              child: SideSpace(
                15,
                10,
                EachReports(
                    Icons.fire_extinguisher_outlined,
                    orange,
                    green1,
                    '1 tanker on fire along Ozumba Mbadiwe V. I.',
                    'Fire',
                    () {}),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT---------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------
//--------------------------------------------------------------EACH REPORT----------------------------

class EachReports extends StatelessWidget {
  EachReports(
    this.iconz,
    this.left,
    this.right,
    this.subtitle,
    this.title,
    this.whenTapped, {
    Key? key,
  }) : super(key: key);
  IconData iconz;
  String title;
  Function whenTapped;
  Color right;
  Color left;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        whenTapped();
      },
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconOf(iconz, black, 20),
                  const XMargin(10),
                  TextOf(title, 18, FontWeight.w400, colorPrimary)
                ],
              ),
              const YMargin(10),
              Container(
                height: 1.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [right, left])),
              ),
              const YMargin(7),
              TextOf(subtitle, 15, FontWeight.w400, ash),
              const YMargin(15),
              Divider(
                color: lightPink,
              ),
              const YMargin(5)
            ],
          )
        ],
      ),
    );
  }
}
