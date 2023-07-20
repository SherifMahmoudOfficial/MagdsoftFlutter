import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../data/models/help_response_model.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        //we user BlocProvider so we can inialize bloc in top of widgets tree
        //also in creation stage we get help data from API
        create: (context) => GlobalCubit()..fetchHelp(),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            // cubit variable initialized to make using of cubit easier 
            var cubit = GlobalCubit.get(context);
            return helpScreen(cubit, context);
          },
        ));
  }

  Scaffold helpScreen(GlobalCubit cubit, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Help',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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

//FutureBuilder waits the API response 
        child: FutureBuilder<HelpResponse>(
          future: cubit.fetchHelp(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.help.length,
                itemBuilder: (context, index) {
                  return buildHelpItem(
                      question: snapshot.data!.help[index].question,
                      answer: snapshot.data!.help[index].answer,
                      key: GlobalKey());
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              );
              //tracing error to handle
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
              // loading while fetching data
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),

  
      ),
    );
  }
// Help Item design
  Padding buildHelpItem(
      {required String question,
      required String answer,
      required final GlobalKey<ExpansionTileCardState> key}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ExpansionTileCard(
        key: key,
        title: Text(
          question,
          style: const TextStyle(color: AppColor.primaryColor),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                answer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
