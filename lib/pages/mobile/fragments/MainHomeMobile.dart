import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas1_mobile_11_pplg_02_01/api/sport_api/SportController.dart';
import 'package:pas1_mobile_11_pplg_02_01/pages/mobile/PageDetail.dart';
import 'package:pas1_mobile_11_pplg_02_01/widgets/MyAppBar.dart';
import 'package:pas1_mobile_11_pplg_02_01/widgets/MyTextButton.dart';

class MainHomeMobile extends StatelessWidget {
  const MainHomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final sportController = Get.put(SportController());
    sportController.fetchData();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: MyAppBar(hasSearchBar: false, textTitle: "SportDb",),
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() {
            return ListView.builder(
                itemCount: sportController.teams.length,
                itemBuilder: (context, index) {
                  final post = sportController.teams[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        showDialog(context: context, builder: (_) => PageDetail(
                          strBadge: post.strBadge,
                          strDesc: post.strDescriptionEn,
                          strTeam: post.strTeam,
                        )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.white12)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 64,
                                        width: 64,
                                        child: Image.network(post.strBadge)
                                    ),
                                    SizedBox(width: 10,),
                                    Text(post.strTeam, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14 * 1.618),),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline, color: Colors.white24,)
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          })
        )
      ),
    );
  }
}
