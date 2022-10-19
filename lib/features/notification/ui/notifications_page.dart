import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/notification/components/circle_notification_tile.dart';
import 'package:ninecoin/features/notification/components/notification_tile.dart';
import 'package:ninecoin/typography/text_styles.dart';

class NotificationPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => const NotificationPage());
  }

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notification",
          style: CoinTextStyle.title1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView(
          children: [
            NotificationTile(
              icon: CircleNotificationIcon(
                  icon: Badge(
                    position: BadgePosition.topEnd(top: -2),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  color: CoinColors.orange),
              title: "Yonqed SDN. BHD.",
              subtitle: "Mauris non ligul tempus lacinia velit.",
              date: "28/4/2022",
            ),
            NotificationTile(
              icon: CircleNotificationIcon(
                  icon: Badge(
                    position: BadgePosition.topEnd(top: -4),
                    child: Image.asset(
                      "assets/icons/coupon.png",
                      height: 25,
                      width: 25,
                    ),
                  ),
                  color: CoinColors.purple),
              title: "Sonyod SDN. BHD.",
              subtitle: "Mauris non ligul tempus lacinia velit.",
              date: "24/4/2022",
            ),
            NotificationTile(
              icon: CircleNotificationIcon(
                  icon: Image.asset(
                    "assets/icons/news.png",
                    height: 25,
                    width: 25,
                  ),
                  color: CoinColors.green),
              title: "Apple Store",
              subtitle: "Mauris non ligul tempus lacinia velit.",
              date: "22/4/2022",
            ),
            NotificationTile(
              icon: CircleNotificationIcon(
                  icon: Image.asset(
                    "assets/icons/lucky-draw.png",
                    height: 25,
                    width: 25,
                  ),
                  color: CoinColors.blueAccent),
              title: "SengQuen SDN. BHD.",
              subtitle: "Mauris non ligul tempus lacinia velit.",
              date: "22/4/2022",
            ),
          ],
        ),
      ),
    );
  }
}
