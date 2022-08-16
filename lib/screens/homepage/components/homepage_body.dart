
import 'package:flutter/material.dart';
import 'package:pingolearn_app/provider/homeprovider.dart';
import 'package:pingolearn_app/utils/size_config.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(16),
          horizontal: getProportionateScreenWidth(16)),
      child: Consumer<HomeProvider>(builder: (context, provider, child) {
        return Center(
          child: (!provider.dataScreen)
              ? Column(
                  children: const [
                    Text(
                      "Press the button to start \n speaking",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    children: [
                      Text(
                        "Your word : \n ${provider.wordData!.word}",
                        style:const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(24),
                      ),
                      Container(
                        color: Colors.grey.shade400,
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(8),
                            horizontal: getProportionateScreenWidth(16)),
                        child: Column(
                          children: [
                          const  Text(
                              "Meaning",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Text(provider.wordData!.meaning.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Container(
                        color: Colors.grey.shade400,
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(8),
                            horizontal: getProportionateScreenWidth(16)),
                        child: Column(
                          children: [
                            const Text(
                              "Example",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(8),
                            ),
                            Text(provider.wordData!.example.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Image.network(
                        (provider.wordData!.imageUrl == null)
                            ? "https://firebasestorage.googleapis.com/v0/b/test-a89cb.appspot.com/o/image_not_found.png?alt=media&token=45551f1b-5b9d-4b96-8d7c-8752d1905f23"
                            : provider.wordData!.imageUrl.toString(),
                        height: getProportionateScreenHeight(200),
                        width: getProportionateScreenWidth(200),
                      )
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
