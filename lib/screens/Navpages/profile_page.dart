import 'package:ecommerce/screens/widgets/app_text_widget.dart';
import 'package:ecommerce/screens/widgets/profile_setting_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.grey[200],
        //   // title: const AppText(
        //   //   text: "Profile",
        //   //   size: 24,
        //   //   color: Colors.black,
        //   // ),
        // ),
        body: Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 34, 51),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 37, 34, 51),
          title: const AppText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/bg.jpg'),
              backgroundColor: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            AppText(
              text: "John Doe",
              color: Colors.white,
              size: 30,
            ),
            AppText(
              text: "@johndoe",
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(200, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {},
              child: const Text("Edit Profile",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 10, endIndent: 10),
            ProfileSettingWidget(
                onTap: () {}, text: "Settings", icon: Icons.settings_outlined),
            ProfileSettingWidget(
              onTap: () {},
              text: "My Trips",
              icon: Icons.place_outlined,
            ),
            ProfileSettingWidget(
                onTap: () {}, text: "Orders", icon: Icons.menu_book_sharp),
            ProfileSettingWidget(
                onTap: () {},
                text: "Uocoming Trips",
                icon: Icons.local_florist_outlined),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 10, endIndent: 10),
            ProfileSettingWidget(
                onTap: () {},
                text: "Help & Support",
                icon: Icons.question_mark_outlined),
            ProfileSettingWidget(
                onTap: () {
                  // logout();
                },
                text: "Logout",
                icon: Icons.logout_outlined),
          ],
        ),
      ),
    ));
  }
}
