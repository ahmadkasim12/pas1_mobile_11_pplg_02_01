import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback minecraft;
  const MyCardWidget({super.key, required this.title, required this.image, required this.minecraft, });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border.all(color: Colors.white12),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image))
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Wrap(
                    //       spacing: 10,
                    //       children: [
                    //         Container(
                    //           height: 20,
                    //           width: 20,
                    //           color: Colors.green,
                    //         ),
                    //         Container(
                    //           height: 20,
                    //           width: 20,
                    //           color: Colors.green,
                    //         ),
                    //         Container(
                    //           height: 20,
                    //           width: 20,
                    //           color: Colors.green,
                    //         ),
                    //         Container(
                    //           height: 20,
                    //           width: 20,
                    //           color: Colors.green,
                    //         ),
                    //       ],
                    //     ),
                    //     Container(
                    //       height: 20,
                    //       width: 20,
                    //       color: Colors.green,
                    //     ),
                    //   ],
                    // ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                border: Border.all(color: Colors.white12),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: Text("Video Game", style: TextStyle(color: Colors.white60),),
                          ),
                          InkWell(
                            onTap: minecraft,
                            child: Icon(Icons.heart_broken),
                          )
                        ],
                      )
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: Text(title, overflow: TextOverflow.fade, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14 * 1.618, color: Colors.white),)),
                        Icon(Icons.keyboard_arrow_right, color: Colors.white60,)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
