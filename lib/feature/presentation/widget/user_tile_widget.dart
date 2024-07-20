import 'package:flutter/material.dart';
import 'package:json_placeholder_app_flutter/feature/data/user_model.dart';

import 'icon_text_widget.dart';

class UserTileWidget extends StatelessWidget {
  final UserModel? user;
  const UserTileWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.25))
            ]),
        child: Column(
          children: [
            Text(
              user?.name ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "(${user?.email})",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  IconTextWidget(
                      icon: Icons.format_list_bulleted,
                      text: user?.id.toString()),
                  IconTextWidget(
                    icon: Icons.email_outlined,
                    text: user?.email,
                  ),
                  IconTextWidget(icon: Icons.phone_android, text: user?.phone),
                  IconTextWidget(icon: Icons.language, text: user?.website),
                  IconTextWidget(
                      icon: Icons.home_outlined,
                      text:
                          "${user?.address?.zipcode} ${user?.address?.city}, ${user?.address?.street}, ${user?.address?.suite}"),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  IconTextWidget(
                      icon: Icons.business_outlined, text: user?.company?.name),
                  IconTextWidget(
                      icon: Icons.format_quote_outlined,
                      text: user?.company?.catchPhrase)
                ]
                    .map((e) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: e,
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
