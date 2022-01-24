import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/navigtion.dart';

//---------------------------------------------------ICONS-------------------------
class IconOf extends StatelessWidget {
  IconOf(this.type, this.color, this.size, {Key? key}) : super(key: key);
  IconData type;
  Color color;
  double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      type,
      color: color,
      size: size,
    );
  }
}

class TextOf extends StatelessWidget {
  TextOf(this.text, this.size, this.weight, this.color, {Key? key})
      : super(key: key);
  String text;
  double size;
  FontWeight weight;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          GoogleFonts.poppins(fontSize: size, fontWeight: weight, color: color),
    );
  }
}

class TextOfDecoration extends StatelessWidget {
  TextOfDecoration(this.text, this.size, this.weight, this.color, {Key? key})
      : super(key: key);
  String text;
  double size;
  FontWeight weight;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontSize: size,
          fontStyle: FontStyle.italic,
          fontWeight: weight,
          color: color),
    );
  }
}

//---------------------------------------------------BUTTON-------------------------
class MediumSizeButton extends StatelessWidget {
  MediumSizeButton(this.onTapped, this.content, this.color, this.radius,
      this.rl, this.tb, this.elevate,
      {Key? key})
      : super(key: key);
  Function onTapped;
  Widget content;
  double rl;
  double tb;
  double radius;
  Color color;
  double elevate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped(),
      child: Card(
        color: color,
        elevation: elevate,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: SideSpace(
              rl,
              tb,
              Center(
                child: content,
              )),
        ),
      ),
    );
  }
}

class SideSpace extends StatelessWidget {
  SideSpace(this.rl, this.tb, this.content, {Key? key}) : super(key: key);
  double rl;
  Widget content;
  double tb;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(rl, tb, rl, tb),
      child: content,
    );
  }
}

class WeisleAppBar extends StatelessWidget {
  WeisleAppBar(this.title, this.end, this.color, {Key? key}) : super(key: key);
  String title;
  Widget end;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            goBack(context);
          },
          child: IconOf(Icons.arrow_back_ios_new_rounded, color, 20),
        ),
        TextOf(title, 20, FontWeight.w600, color),
        end
      ],
    );
  }
}
