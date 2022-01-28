import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = "/Dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 72;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return WillPopScope(
      onWillPop: () async {
        //TODO
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            tr("app.app_name"),
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
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        drawer: Drawer(
          backgroundColor: colorBackground,
        ),
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
                  text: tr("app.shops"),
                  icon: assetIconShops,
                  size: buttonSize.r,
                ),
                DashboardButton(
                  onTap: () =>
                      Navigator.pushNamed(context, MeasureHomeScreen.route),
                  text: tr("app.measure"),
                  icon: assetIconMeasure,
                  size: buttonSize.r,
                ),
                DashboardButton(
                  onTap: () async {
                    BaseController().showBusy(context, function: () async {
                      await Future.delayed(const Duration(seconds: 2));
                      return true;
                    });
                    // showModalBottomSheet(
                    //     backgroundColor: colorBackground,
                    //     context: context,
                    //     builder: (_) => SizedBox(
                    //         height: 200.r,
                    //         child: Padding(
                    //           padding: EdgeInsets.all(16.0.r),
                    //           child: Column(
                    //             children: [
                    //               Text(
                    //                 "Data Syncing",
                    //                 style: UI.textTheme.headline6!
                    //                     .copyWith(color: Colors.white),
                    //               ),
                    //               Spacer(),
                    //               LinearProgressIndicator(
                    //                 color: colorGreen,
                    //               ),
                    //             ],
                    //           ),
                    //         )));
                    // Timer(Duration(seconds: 8), () {
                    //   Navigator.maybePop(context);

                    // });
                  },
                  text: tr("app.sync"),
                  icon: assetIconSync,
                  size: buttonSize.r,
                ),
                DashboardButton(
                  onTap: () => Navigator.pushNamed(
                      context, LiquorBottleDatabaseScreen.route),
                  text: tr("app.bottle_db"),
                  icon: assetIconLiquors,
                  size: buttonSize.r,
                ),
                DashboardButton(
                  onTap: () =>
                      Navigator.pushNamed(context, ReportHomeScreen.route),
                  text: tr("app.resports"),
                  icon: assetIconReports,
                  size: buttonSize.r,
                ),
                DashboardButton(
                  onTap: () =>
                      Navigator.pushNamed(context, SettingsScreen.route),
                  text: tr("app.settings"),
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
              tr("dashboard.stats").toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: colorWhite,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 16.r,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return LiquorStatsTile();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
