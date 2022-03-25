import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_Information.dart';
import 'package:rafiq/views/profile/widgets/profile_home.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: SafeArea(
          child: Builder(builder: (context) {
            TabController _tabController = DefaultTabController.of(context)!;

            _tabController.addListener(
              () => BlocProvider.of<ProfileCubit>(context)
                  .ChangeIndex(_tabController.index),
            );
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: h(1000),
                  child: Column(
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
                      const ProfileInformation(),
                      SizedBox(
                        height: h(25),
                      ),
                      ProfileHome(
                        tabController: _tabController,
                      ),
                      // CutsomBottomNavigationBar(),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
