import 'package:flutter/material.dart';
import 'package:sneakers_app/animations/fade_animations.dart';
import 'package:sneakers_app/data/dummy_data.dart';
import 'package:sneakers_app/models/models.dart';
import 'package:sneakers_app/theme/cusstom_app_theme.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/user_profile/components/app_bar.dart';

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
              FadeAnimation(
                  delay: 2,
                  child: Container(
                    width: width,
                    height: height / 3,
                    color: Colors.red,
                    child: Column(
                      children: [Text("Dashbourd")],
                    ),
                  ))
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
