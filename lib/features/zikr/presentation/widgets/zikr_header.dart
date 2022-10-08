import 'package:flutter/material.dart';
import 'package:tafsir/core/configurator/colors.dart';

class ZikrHeader extends StatelessWidget {
  final String zikrName;
  final Function onTap;
  final String whenRead;
  final int count;
  const ZikrHeader({Key key, this.zikrName, this.onTap, this.whenRead, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 110,
        margin: EdgeInsets.fromLTRB(14, 0, 14, 20),
        padding: EdgeInsets.only(left: 14, top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purpleAccent, primaryColor.withOpacity(0.9)],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.menu_book, color: whiteColor, size: 20),
                        SizedBox(width: 8),
                        Text(whenRead,
                            style: Theme.of(context)
                                .textTheme
                                .apply(bodyColor: whiteColor, fontSizeDelta: -5)
                                .bodyText1),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Surah title
                        Text(zikrName,
                            style: Theme.of(context)
                                .textTheme
                                .apply(bodyColor: whiteColor)
                                .bodyText2),
                        
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -40,
                bottom: -40,
                child: Container(
                  width: 200,
                  child: Image.asset('assets/images/quran_icon.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
