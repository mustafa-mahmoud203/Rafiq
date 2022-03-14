import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';
import 'package:rafiq/views/profile/widgets/row_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: const Color(0xffE8DEEB),
      ),
      body: Column(
        children: [
          SizedBox(
            height: h(288),
            child: Stack(
              children: const [
                Cover(),
                ProfilePhoto(),
                ProfileName(),
                EditButton(),
              ],
            ),
          ),
          SizedBox(
            height: h(31),
          ),
          Column(
            children: const [
              RowData(
                imagePath: 'assets/images/posts_icon.svg',
                text: '0 Posts',
                sizedWidth: 12.25,
              ),
              RowData(
                imagePath: 'assets/images/followers_icon.svg',
                text: '0 Followers',
                sizedWidth: 6.66,
              ),
              RowData(
                imagePath: 'assets/images/location_icon.svg',
                text: 'From Egypt',
                sizedWidth: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
