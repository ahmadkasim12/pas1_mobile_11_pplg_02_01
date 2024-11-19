import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11_pplg_02_01/pages/mobile/LoginMobile.dart';
import 'package:pas1_mobile_11_pplg_02_01/pages/mobile/RegisterMobile.dart';
import 'package:pas1_mobile_11_pplg_02_01/pages/mobile/fragments/FavoriteMobile.dart';
import 'package:pas1_mobile_11_pplg_02_01/pages/mobile/fragments/MainHomeMobile.dart';
import 'package:pas1_mobile_11_pplg_02_01/pages/mobile/fragments/ProfileMobile.dart';

import '../../api/login_api/LoginController.dart';
import '../../controller/NavBarController.dart';

class MobileNavigator extends StatelessWidget {
  const MobileNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final navBarController = Get.put(NavBarController());
    final List<Widget> indexNavigator = [MainHomeMobile(), FavoriteMobile(), ProfileMobile()];
    final List<IconData> listIcon = [Icons.home_filled, Icons.favorite, Icons.account_circle];

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: indexNavigator[navBarController.selectedIndex.value],
        bottomNavigationBar: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: double.infinity),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white12,
            ),
            child: Expanded(
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: indexNavigator.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () => navBarController.selectedIndex(index),
                      splashColor: Colors.white12,
                      highlightColor: Colors.transparent,
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              margin: EdgeInsets.only(
                                bottom: index == navBarController.selectedIndex.value
                                    ? 0
                                    : 10,
                                right: 10,
                                left: 10,
                              ),
                              width: 60,
                              height:
                              index == navBarController.selectedIndex.value ? 5 : 0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(10),
                                ),
                              ),
                            ),
                            Icon(
                                listIcon[index],
                                color: index == navBarController.selectedIndex.value
                                    ? Colors.white
                                    : const Color(0x50ffffff),
                              size: 32,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      // return Scaffold(
      //   body: indexNavigator[navBarController.selectedIndex.value],
      //   bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Theme.of(context).colorScheme.primary,
      //     currentIndex: navBarController.selectedIndex.value,
      //     onTap: navBarController.changeMenuTo,
      //     items: const [
      //        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Search"),
//              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Library"),
      //     ],
      //   ),
      // );
    });
  }
}