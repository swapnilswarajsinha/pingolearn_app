import 'package:flutter/material.dart';
import 'package:pingolearn_app/provider/homeprovider.dart';
import 'package:pingolearn_app/screens/homepage/components/floatingaction_button.dart';

import 'package:pingolearn_app/screens/homepage/components/homepage_body.dart';
import 'package:pingolearn_app/utils/size_config.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("PingoLearn-Round 1"),
            centerTitle: true,
          ),
          body:const HomePageBody(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const FloatingActionSpeechButton(),
        ));
  }
}
