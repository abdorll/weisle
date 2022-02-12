import 'package:flutter/material.dart';
import 'package:weisle/logic/toggle_password_visibility/toggle_password_visibility_bloc.dart';
import 'package:weisle/ui/constants/colors.dart';

class PlainTextField extends StatelessWidget {
  const PlainTextField(
      {Key? key,
      this.leading,
      this.trailing,
      this.hint,
      this.info,
      this.stream,
      this.enabled,
      this.onchanged,
      this.maxLines,
      this.controller})
      : super(key: key);
  final String? hint;
  final Widget? info;
  final Stream? stream;
  final Function(String e)? onchanged;
  final int? maxLines;
  final bool? enabled;
  final Widget? leading;
  final Widget? trailing;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: controller,
                  enabled: enabled ?? true,
                  maxLines: maxLines ?? 1,
                  onChanged: onchanged,
                  decoration: InputDecoration(
                      hintText: hint,
                      suffixIcon: trailing,
                      prefixIcon: leading,
                      prefixStyle: TextStyle(color: colorPrimary),
                      errorText:
                          snapshot.hasError ? snapshot.error.toString() : null),
                );
              })
        ],
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField(
      {Key? key,
      this.hint,
      this.info,
      this.stream,
      this.onchanged,
      this.leading})
      : super(key: key);

  final Widget? info;
  final String? hint;
  final Widget? leading;
  final Stream? stream;
  final Function(String e)? onchanged;

  @override
  Widget build(BuildContext context) {
    TogglePasswordVisibilityBloc togglePasswordVisibilityBloc =
        // ignore: unnecessary_new
        TogglePasswordVisibilityBloc();
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                return StreamBuilder<bool>(
                    initialData: true,
                    stream: togglePasswordVisibilityBloc.showPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                        obscureText: snapshot.data ?? true,
                        onChanged: onchanged,
                        decoration: InputDecoration(
                            hintText: hint,
                            prefixIcon: leading,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                  onTap: () => togglePasswordVisibilityBloc
                                      .toggleShowPassword(),
                                  child: const Icon(Icons.visibility)),
                            ),
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null),
                      );
                    });
              })
        ],
      ),
    );
  }
}

class TextCheckBox extends StatelessWidget {
  const TextCheckBox({Key? key, this.text, this.stream, this.onchanged})
      : super(key: key);

  final String? text;
  final Stream<bool>? stream;
  final void Function(bool? e)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StreamBuilder<bool>(
              stream: stream,
              builder: (context, snapshot) {
                return Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.all(colorPrimary),
                    value: snapshot.data ?? false,
                    onChanged: onchanged);
              }),
          const SizedBox(
            width: 10,
          ),
          Text(
            text!,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class SelectField extends StatelessWidget {
  const SelectField(
      {Key? key,
      this.label,
      this.hint,
      this.info,
      this.items,
      this.stream,
      this.onchanged})
      : super(key: key);

  final String? label;
  final String? hint;
  final Widget? info;
  final List<String>? items;
  final Stream? stream;
  final void Function(String? e)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26),
      child: Column(
        children: [
          Row(
            children: [
              Text(label!),
              Visibility(visible: info != null, child: const Icon(Icons.info))
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          DropdownButtonFormField<String>(
            isExpanded: true,
            value: items![0],
            onChanged: onchanged!,
            isDense: true,
            items: items!
                .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                      child: Text(
                        e,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                      value: e,
                      // ignore: avoid_returning_null_for_void
                      onTap: () => null,
                    ))
                .toList(),
            hint: Text(
              "$hint",
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff999999),
                  fontSize: 14),
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
          )
        ],
      ),
    );
  }
}
