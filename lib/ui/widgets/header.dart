import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/asset_images.dart';
import 'package:weisle/ui/constants/colors.dart';
import 'package:weisle/ui/widgets/basic_widgets.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeisleHeader(
        InkWell(
          child: Image.asset(
            weisle_logo,
            height: 30,
          ),
        ),
        Image.asset(
          headericons,
          height: 30,
        ),
        Card(
          shadowColor: ash,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: SideSpace(
            2,
            2,
            Stack(
              children: [
                Image.asset(
                  alarm,
                  height: 40,
                ),
                const Positioned(
                    bottom: 20,
                    left: 20,
                    child:
                        CircleAvatar(radius: 4, backgroundColor: Colors.pink))
              ],
            ),
          ),
        ));
  }
}
