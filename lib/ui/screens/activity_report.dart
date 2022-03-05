import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weisle/currentLocation.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';
import 'package:weisle/ui/widgets/margin.dart';
import 'package:weisle/ui/widgets/navigtion.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weisle/utils/user_details_getter.dart';
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
              const YMargin(10),
              Image.asset("assets/icons/headericons.png",
                  height: 30, width: 30),
              const YMargin(10),
              SideSpace(
                10,
                0,
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  InkWell(
                      onTap: () {
                        navigate(context, const Tracker());
                      },
                      child: IconOf(Icons.alarm_add_rounded, black, 30))
                ]),
              ),
              const YMargin(10),
              SideSpace(
                10,
                0,
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: white,
                      radius: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextOf(
                            ((now > 12) || (now <= 16))
                                ? 'Good morning💭'
                                : ((now > 16) || (now < 20))
                                    ? 'Good afernoon🌤️'
                                    : "Good evening🌕",
                            14,
                            FontWeight.w400,
                            ash),
                        const YMargin(5),
                        Consumer<UserDetailsGetter>(
                            builder: ((context, value, child) {
                          return TextOf(
                              "${value.fullName}", 18, FontWeight.w400, black);
                        })),
                      ],
                    )
                  ],
                ),
              ),
              Image.asset("assets/images/lagos_map.png",
                  height: 190, width: double.infinity),
              SideSpace(
                10,
                0,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
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
                    ),
                    Row(children: [
                      TextOf('Activity', 20, FontWeight.w500, black)
                    ]),
                    const YMargin(10),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              navigate(context, CurrenLocation());
                            },
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                child: SideSpace(
                                    40,
                                    40,
                                    Center(
                                      child: Column(
                                        children: [
                                          IconOf(Icons.wash_rounded,
                                              colorPrimary, 40),
                                          TextOf('Robbery', 18, FontWeight.w400,
                                              colorPrimary)
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                child: SideSpace(
                                    40,
                                    40,
                                    Center(
                                      child: Column(
                                        children: [
                                          IconOf(Icons.wash_rounded,
                                              colorPrimary, 40),
                                          TextOf('Robbery', 18, FontWeight.w400,
                                              colorPrimary)
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                color: null,
                                child: SideSpace(
                                    40,
                                    40,
                                    Center(
                                      child: Column(
                                        children: [
                                          IconOf(Icons.wash_rounded,
                                              colorPrimary, 40),
                                          TextOf('Robbery', 18, FontWeight.w400,
                                              colorPrimary)
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 3.0,
                              child: Container(
                                child: SideSpace(
                                    40,
                                    40,
                                    Center(
                                      child: Column(
                                        children: [
                                          IconOf(Icons.wash_rounded,
                                              colorPrimary, 40),
                                          TextOf('Robbery', 18, FontWeight.w400,
                                              colorPrimary)
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ])
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
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const YMargin(10),
              Image.asset("assets/icons/headericons.png",
                  height: 30, width: 30),
              const YMargin(10),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SideSpace(10, 10,
                        TextOf('Aguda, Surulere', 18, FontWeight.w300, white))
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
                              TextOf(
                                  'Active', 20, FontWeight.w400, colorPrimary),
                              const XMargin(10),
                              IconOf(Icons.done_all_rounded, colorPrimary, 20),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MakeReport()));
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
              const YMargin(20),
              Container(
                width: double.infinity,
                height: 100,
                child: Center(
                    child: TextOfDecoration('Banner Ads', 20, FontWeight.w500,
                        black, TextAlign.center)),
                decoration: BoxDecoration(color: white),
              )
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
