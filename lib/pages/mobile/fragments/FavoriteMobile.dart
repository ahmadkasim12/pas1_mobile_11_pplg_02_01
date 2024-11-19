import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pas1_mobile_11_pplg_02_01/widgets/MyAppBar.dart';

import '../../../database/DatabaseController.dart';

class FavoriteMobile extends StatelessWidget {
  const FavoriteMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseController = Get.put(DatabaseController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: MyAppBar(hasSearchBar: false, textTitle: "Favorites"),
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Obx(() {
            return ListView.builder(
                itemCount: databaseController.favoritedGames.length,
                itemBuilder: (context, index) {
                  final favoritedGame = databaseController.favoritedGames[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
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
                                        child: Image.network(favoritedGame.strBadge)
                                    ),
                                    SizedBox(width: 10,),
                                    Text(favoritedGame.strTeam, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14 * 1.618),),
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
          }),
        ),
      ),
    );
  }
}
