import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../styles/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GlobalCubit(),
        child: BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {},
            builder: (context, state) {
              // var cubit = GlobalCubit.get(context);
              return Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    // height: MediaQuery.sizeOf(context).height,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            backButton(),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Predator Helios 300',
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Predator Helios 300',
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            productImageView(),
                            const SizedBox(
                              height: 15,
                            ),
                            productImages(),
                            const SizedBox(
                              height: 10,
                            ),
                            store(),
                            const SizedBox(
                              height: 30,
                            ),
                            cartSection(),
                            const SizedBox(
                              height: 30,
                            ),
                            myDivider(context),
                           const SizedBox(
                              height: 15,
                            ),
                            detailsBar(),
                           const SizedBox(
                              height: 30,
                            ),
                           const Text(
                              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. ''',
                              style: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  Row detailsBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Overview',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
           const CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              radius: 3,
            )
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child:const Text(
                'Spesification',
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
           const CircleAvatar(
              backgroundColor: AppColor.white,
              radius: 3,
            )
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child:const Text(
                'Review',
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
           const CircleAvatar(
              backgroundColor: AppColor.white,
              radius: 3,
            )
          ],
        ),
      ],
    );
  }

  Center myDivider(BuildContext context) {
    return Center(
      child: Container(
        height: 2,
        width: MediaQuery.sizeOf(context).width / 1.5,
        decoration:const BoxDecoration(
          color: AppColor.grey,
        ),
      ),
    );
  }

  Row cartSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: TextStyle(fontSize: 12, color: AppColor.grey),
            ),
            Text(
              '30,000 EGP',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        Container(
          height: 44,
          width: 200,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColor.primaryColor, Color(0x440062bd)],
              )),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            child: const Center(
              child: Text(
                "Add To Cart",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
      ],
    );
  }

  Container store() {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset:const  Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:const Image(
                image: AssetImage('assets/images/acer-logo.png'),
              ),
            ),
          ),
         const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Acer Official Store',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  'View Store',
                  style: TextStyle(fontSize: 12, color: AppColor.grey),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:const Icon(
                Icons.arrow_forward_ios,
                color: AppColor.primaryColor,
                size: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container productImageView() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset:const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child:const Padding(
        padding:  EdgeInsets.all(40),
        child: Image(
          image: AssetImage('assets/images/lap1.png'),
        ),
      ),
    );
  }

  GestureDetector backButton() {
    return GestureDetector(
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
        child:const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.grey,
        ),
      ),
    );
  }

  SingleChildScrollView productImages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const Padding(
                padding:  EdgeInsets.all(15),
                child: Image(
                  image: AssetImage('assets/images/lap1.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:const Padding(
                padding:  EdgeInsets.all(15),
                child: Image(
                  image: AssetImage('assets/images/lap5.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:const Padding(
                padding: EdgeInsets.all(15),
                child: Image(
                  image: AssetImage('assets/images/lap6.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:const Padding(
                padding:  EdgeInsets.all(15),
                child: Image(
                  image: AssetImage('assets/images/lap1.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
