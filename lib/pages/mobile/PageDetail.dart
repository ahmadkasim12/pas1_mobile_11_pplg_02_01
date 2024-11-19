import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  final String strTeam, strBadge, strDesc;
  const PageDetail({super.key, required this.strTeam, required this.strBadge, required this.strDesc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 180,
                width: 180,
                child: Image.network(strBadge)
              ),
              SizedBox(height: 20),
              Text(strTeam, style: TextStyle(fontSize: 14 * 1.618, fontWeight: FontWeight.w900, color: Colors.white),),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.white12)
                ),
                width: double.infinity,
                height: 568,
                child: Padding(
                  padding:EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Description", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),),
                        Divider(color: Colors.white12,),
                        Text(strDesc, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white60),),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        )
      ),
    );
  }
}
