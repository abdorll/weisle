import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/asset_images.dart';
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
        Image.asset(
          alarm,
          height: 40,
        ));
  }
}
