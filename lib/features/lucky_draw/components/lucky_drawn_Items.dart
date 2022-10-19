import 'package:flutter/material.dart';
import 'package:ninecoin/config/helper/common%20/get_user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/luckyDraw/lucky_drawn_response.dart';
import '../services/lucky_draw.dart';
import '../ui/drawn_details_page.dart';
import 'drawn_tile.dart';

class LuckyDrwanItems extends StatefulWidget {
  const LuckyDrwanItems({Key? key}) : super(key: key);

  @override
  State<LuckyDrwanItems> createState() => _LuckyDrwanItemsState();
}

class _LuckyDrwanItemsState extends State<LuckyDrwanItems> {
  String? userId;
  late LuckyDrawnResponse luckyDrawn;

  @override
  void initState() {
    getUserId().then((value) => setState(() {
          userId = value.toString();
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userId == null
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : FutureBuilder<dynamic>(
            future: getLuckyDrawn(userId!),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              luckyDrawn = snapshot.data;
              
              return luckyDrawn.data.isEmpty ? const Center(child: Text("You are not participated in luckydraw yet"),) :  ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 22),
                itemCount: luckyDrawn.data.length,
                itemBuilder: (_, index) {
                  return DrawnTile(
                    onTap: () {
                      Navigator.push(context, DrawnDetailsPage.route());
                    },
                    title: luckyDrawn.data[index].name,
                    startingDate: luckyDrawn.data[index].date.toString(),
                    endDate: "",
                  );
                },
              );
            });
  }
}
