import 'package:flutter/material.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/models.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/user_profile/components/app_bar.dart';
import 'package:sneakers_app/view/user_profile/components/rounded_list_tile.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  int statusIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: UserProfileWidget(),
      backgroundColor: AppConstantsColor.backgroundColor,
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          child: Column(
            children: [
              TopUserInfo(width: width),
              SizedBox(height: height * 0.01),
              _userStatusListView(width, height),
              RoundetListWidget(width: width, height: height),
              ButtomSideText(width: width, height: height)
            ],
          ),
        ),
      ),
    );
  }

  Widget _userStatusListView(double width, double height) {
    return FadeAnimation(
      delay: 1.5,
      child: SizedBox(
        width: width,
        height: height * 0.12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Status",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: height * 0.005),
            SizedBox(
              width: width,
              height: height * 0.08,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: userStatus.length,
                  itemBuilder: (context, index) {
                    UserStatus status = userStatus[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          statusIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: statusIndex == index
                              ? status.selectColor
                              : status.unSelectColor,
                        ),
                        margin: EdgeInsets.all(5),
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              status.emoji,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              status.txt,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppConstantsColor.lightTextColor,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ButtomSideText extends StatelessWidget {
  const ButtomSideText({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 2,
      child: SizedBox(
        width: width,
        height: height / 6.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Ackount",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: height * 0.01),
            const Text(
              "Switch to Other Account",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.blue),
            ),
            SizedBox(height: height * 0.015),
            Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.red[500],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundetListWidget extends StatelessWidget {
  const RoundetListWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 2,
      child: Container(
        width: width,
        height: height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dashbourd",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey),
            ),
            const SizedBox(height: 0.01),
            RoundedListTile(
              icon: Icons.wallet_travel_outlined,
              title: 'Paiments',
              leaDingBackColor: Colors.green[600],
              trailing: Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "2 New",
                      style: TextStyle(
                        color: AppConstantsColor.lightTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.lightTextColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            RoundedListTile(
              icon: Icons.archive,
              title: "Achievement's",
              leaDingBackColor: Colors.yellow[600],
              trailing: Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.darkTextColor,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            RoundedListTile(
              icon: Icons.shield,
              title: "Privasy",
              leaDingBackColor: Colors.grey[600],
              trailing: Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Action Needed",
                      style: TextStyle(
                        color: AppConstantsColor.lightTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.darkTextColor,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopUserInfo extends StatelessWidget {
  const TopUserInfo({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/nike1.png"),
          ),
          SizedBox(width: width * 0.03),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bektur.S Zulpukarov",
                style: AppThemes.profileDevName,
              ),
              SizedBox(height: 2),
              Text(
                "Flutter Devoloper",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(width: width * 0.03),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
          )
        ],
      ),
    );
  }
}
