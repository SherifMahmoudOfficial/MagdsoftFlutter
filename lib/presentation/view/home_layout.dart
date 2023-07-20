// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GlobalCubit(),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GlobalCubit.get(context);
            return homeLayout(cubit, context);
          },
        ));
  }

  Scaffold homeLayout(GlobalCubit cubit, BuildContext context) {
    // int index = 0;
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.simple,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.exit_to_app,
              color: AppColor.grey,
            ),
            title: const Text('Logout'),
          ),
          BottomBarItem(
            icon:const Icon(
              Icons.favorite,
              color: AppColor.grey,
            ),
            title:const Text('Favorites'),
          ),
          BottomBarItem(
            icon:const Icon(
              Icons.home,
              color: AppColor.white,
            ),
            title:const Text('home'),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.notifications,
              color: AppColor.grey,
            ),
            title:const Text('notifications'),
          ),
          BottomBarItem(
            icon:const Icon(
              Icons.settings,
              color: AppColor.grey,
            ),
            title:const Text('Settings'),
          ),
        ],
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        currentIndex: GlobalCubit.currentScreenIndex,
        onTap: (index) {
          cubit.changeBottomNav(index, context);
          // cubit.homeLayoutController.jumpToPage(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.changeBottomNav(2, context);
        
        },
        backgroundColor: AppColor.primaryColor,
        child:const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //the layout is the main structure of home design so we just change body screen 
      body: GlobalCubit.screens[GlobalCubit.currentScreenIndex],
    );
  }
}
