import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_constraints.dart';
import 'package:food_delivery_app/ui/utils/constraints/ui_media.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: _size.height,
        color: Colors.white,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.0,
              child: ClipOval(
                child: Image.asset(UiMedia.instance.profilePath),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Isabella Williams',
              style: UiConstraints.instance.px18w600k171718,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'isabella_1995@gmail.com',
              style: UiConstraints.instance.px11w500k617282,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: UiConstraints.instance.k3a4f66,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text('My Profile', style: UiConstraints.instance.px14w600k3a4f66),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: UiConstraints.instance.k3a4f66),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text('My Address', style: UiConstraints.instance.px14w600k3a4f66),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Icon(Icons.payment, color: UiConstraints.instance.k3a4f66),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text('Payment Method', style: UiConstraints.instance.px14w600k3a4f66),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Icon(Icons.settings, color: UiConstraints.instance.k3a4f66),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text('Settings', style: UiConstraints.instance.px14w600k3a4f66),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Icon(Icons.help, color: UiConstraints.instance.k3a4f66),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text('Help & FAQ', style: UiConstraints.instance.px14w600k3a4f66),
                ],
              ),
            ),
            const Spacer(),
            FittedBox(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: UiConstraints.instance.kfe734c,
                  shape: const StadiumBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16.0,
                        backgroundColor: UiConstraints.instance.kfff,
                        child: Icon(
                          Icons.power_settings_new,
                          color: UiConstraints.instance.kfe734c,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text('Log Out'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
