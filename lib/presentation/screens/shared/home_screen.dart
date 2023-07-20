import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/input_field.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../data/models/product_model.dart';
import '../../styles/colors.dart';
import '../../view/product_card.dart';
import '../../widget/build_category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GlobalCubit()..getProducts(),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = GlobalCubit.get(context);
            return homeScreen(context, cubit);
          },
        ));
  }

  Scaffold homeScreen(BuildContext context, GlobalCubit cubit) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //we do not use height and width because this container child of SingleChildScrollView
          // height: double.infinity,
          // width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.primaryColor,
                AppColor.white,
                AppColor.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  const  SizedBox(
                      height: 10,
                    ),
                    searchBar(context),
                  const  SizedBox(
                      height: 10,
                    ),
                    homeBanner(),
                  const  SizedBox(
                      height: 10,
                    ),
                    //here we can use listview separated this is another solution
                    categories(),
                  const  SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FutureBuilder<List<Product>>(
                        future: cubit.getProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final products = snapshot.data!;
                            //StaggeredGrid used to make the grid items not equal as UI design
                            return StaggeredGrid.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 40,
                              children: [
                             const   SizedBox(
                                  height: 60,
                                  child: Text(
                                    'Recomended for You',
                                    style: TextStyle(
                                      color: Color(0xFF464646),
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                ...products
                                    .map((product) => productCard(
                                          context: context,
                                          productImage:
                                              Image.network(product.image),
                                          isFavorite: true,
                                          productCompany: product.company,
                                          productName: product.name,
                                          productPrice: product.price,
                                        ))
                                    .toList(),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            categoryItem(
              image: const AssetImage(
                'assets/images/trophy.png',
              ),
              name: 'All',
              isSelected: true,
            ),
           const SizedBox(
              width: 15,
            ),
            categoryItem(
              image:const AssetImage(
                'assets/images/acer.png',
              ),
              name: 'Acer',
              isSelected: false,
            ),
           const SizedBox(
              width: 15,
            ),
            categoryItem(
              image:const AssetImage(
                'assets/images/razer.png',
              ),
              name: 'Razer',
              isSelected: false,
            ),
           const SizedBox(
              width: 15,
            ),
            categoryItem(
              image:const AssetImage(
                'assets/images/apple-logo.png',
              ),
              name: 'Apple',
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget homeBanner() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Builder(
            builder: (context) => buildBannerItem(
                bannerImage: const Image(
                  image: AssetImage('assets/images/home-banner.png'),
                ),
                bannerTitle: 'New Release',
                bannerSubTitle: 'Acer Predator Helios 300',
                context: context),
          ),
          Builder(
            builder: (context) => buildBannerItem(
                bannerImage:const Image(
                  image: AssetImage('assets/images/home-banner2.png'),
                ),
                bannerTitle: '',
                bannerSubTitle: '',
                context: context),
          ),
        ],
      ),
    );
  }

  Stack buildBannerItem(
      {required Image bannerImage,
      required String bannerTitle,
      required String bannerSubTitle,
      required BuildContext context}) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 176,
          width: MediaQuery.sizeOf(context).width,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: bannerImage,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bannerTitle,
                style: const TextStyle(color: AppColor.white, fontSize: 11),
              ),
              Text(
                bannerSubTitle,
                style: const TextStyle(color: AppColor.white, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row searchBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.sizeOf(context).width / 1.35,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: inputField(
                controller: TextEditingController(),
                label: 'Search',
                isValidText: 'Must not be empty',
                suffix: const Icon(
                  Icons.search,
                  color: AppColor.grey,
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            // print('icon clicked');
          },
          child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.white,
              ),
              child: const Image(
                image: AssetImage('assets/images/ico.png'),
              )),
        ),
      ],
    );
  }
}
