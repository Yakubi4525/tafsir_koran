import 'package:flutter/material.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:tafsir/features/pray_time/presentation/pages/pray_time_page.dart';
import 'package:tafsir/features/tafsir/presentation/pages/tafsir_page.dart';
import 'package:tafsir/features/zikr/presentation/pages/zikr_page.dart';

class MainPage extends StatefulWidget {
  
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 2;

  final List<Widget> screens = [
    TafsirPage(),
    ZikrPage(),
    PrayTimePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget curreatPage = TafsirPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: curreatPage),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image(
                  image: AssetImage('assets/icons/quran.png'),
                )),
            onPressed: () {
              setState(() {
                curreatPage = TafsirPage();
                currentTab = 2;
              });
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      curreatPage = PrayTimePage();
                      currentTab = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: currentTab == 0
                        ? Image(
                            image: AssetImage('assets/icons/pray_active.png'),
                          )
                        : Image(
                            image: AssetImage('assets/icons/pray.png'),
                          ),
                  )),
              MaterialButton(
                  minWidth: 60,
                  onPressed: () {
                    setState(() {
                      curreatPage = ZikrPage();
                      currentTab = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: currentTab==1?Image(
                      image: AssetImage('assets/icons/zikr_active.png'),
                    ):
                    Image(
                      image: AssetImage('assets/icons/zikr.png'),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
