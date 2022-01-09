import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = "/Dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 72;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr("app_name"),
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          icon: Image.asset(
            assetIconDrawer,
            color: colorGreen,
            height: 16.r,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              DashboardButton(
                onTap: () =>
                    Navigator.pushNamed(context, ShopsHomeScreen.route),
                text: "Shops/Bars",
                icon: assetIconShops,
                size: buttonSize.r,
              ),
              DashboardButton(
                onTap: () =>
                    Navigator.pushNamed(context, MeasureHomeScreen.route),
                text: "Measure",
                icon: assetIconMeasure,
                size: buttonSize.r,
              ),
              DashboardButton(
                onTap: () =>
                    Navigator.pushNamed(context, DashboardScreen.route),
                text: "Sync",
                icon: assetIconSync,
                size: buttonSize.r,
              ),
              DashboardButton(
                onTap: () => Navigator.pushNamed(
                    context, LiquorBottleDatabaseScreen.route),
                text: "Liquor Bottles",
                icon: assetIconLiquors,
                size: buttonSize.r,
              ),
              DashboardButton(
                onTap: () =>
                    Navigator.pushNamed(context, DashboardScreen.route),
                text: "Reports",
                icon: assetIconReports,
                size: buttonSize.r,
              ),
              DashboardButton(
                onTap: () => Navigator.pushNamed(context, SettingsScreen.route),
                text: "Settings",
                icon: assetIconSettings,
                size: buttonSize.r,
              ),
            ],
          ),
          SizedBox(
            height: 16.r,
            width: double.infinity,
          ),
          Text(
            "STATISTICS",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: colorWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 16.r,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return LiquorStatsTile();
              },
            ),
          )
        ],
      ),
    );
  }
}
