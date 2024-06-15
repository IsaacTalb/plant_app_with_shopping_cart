import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class OptionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextStyle? textStyle;

  const OptionWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(19, 135, 206, 250), // Soft sky blue color
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // Reduced vertical padding
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the start
        children: [
          Icon(icon, size: 24), // Adjust icon size if needed
          const SizedBox(width: 10), // Spacing between icon and text
          Text(
            title,
            style: textStyle ?? const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            // Profile Image
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(0.5),
                  width: 5,
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.avif'),
                backgroundColor: Colors.transparent,
                radius: 70,
              ),
            ),
            // Profile Name
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Isaac Talb',
                  style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 20,
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 20,
                  child: Image.asset('assets/images/verified.png'),
                ),
              ],
            ),
            // Profile Email

            const SizedBox(height: 7),
            Text(
              'testing@dc.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(0.4),
                fontSize: 15,
                fontFamily: 'Arial',
              ),
            ),

            const SizedBox(height: 20),

            // Profile Bio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Flowers',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 16,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '12',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 16,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '120',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 16,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '1200',
                      style: TextStyle(
                        color: Constants.blackColor.withOpacity(0.4),
                        fontSize: 15,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Profile Options
            const SizedBox(height: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 2,
                      right: 2,
                      top: 8,
                      bottom: 2), // Add margin around each OptionWidget
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: const Align(
                    alignment: Alignment.center,
                    child: OptionWidget(
                        icon: Icons.person,
                        title: 'My Profile',
                        textStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(
                      2), // Add margin around each OptionWidget
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: const Align(
                    alignment: Alignment.center,
                    child: OptionWidget(
                        icon: Icons.settings,
                        title: 'Settings',
                        textStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(
                      2), // Add margin around each OptionWidget
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: const Align(
                    alignment: Alignment.center,
                    child: OptionWidget(
                        icon: Icons.notifications,
                        title: 'Notifications',
                        textStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(
                      2), // Add margin around each OptionWidget
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: const Align(
                    alignment: Alignment.center,
                    child: OptionWidget(
                        icon: Icons.share,
                        title: 'Networks',
                        textStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(
                      2), // Add margin around each OptionWidget
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: const Align(
                    alignment: Alignment.center,
                    child: OptionWidget(
                        icon: Icons.logout,
                        title: 'Logout',
                        textStyle: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
