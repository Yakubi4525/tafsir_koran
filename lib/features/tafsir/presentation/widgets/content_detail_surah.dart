import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tafsir/controlllers/bookmark_controller.dart';
import 'package:tafsir/core/configurator/colors.dart';

class ContentDetailSurah extends StatefulWidget {

  final data;
  final int index;
  ContentDetailSurah({this.data, this.index});

  @override
  _ContentDetailSurahState createState() => _ContentDetailSurahState();
}

class _ContentDetailSurahState extends State<ContentDetailSurah> {
  AudioPlayer audioPlayer=new AudioPlayer();

  var isplaying=false;

  @override
  Widget build(BuildContext context) {
    var verses = widget.data.verses[widget.index];
     print('audio ${verses.audio.primary}');
    return Column(
      children: [
        //Event widget
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Number
              Container(
                margin: EdgeInsets.fromLTRB(10, 4, 0, 4),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(verses.number.inSurah.toString(),
                      style: Theme.of(context).textTheme.subtitle2),
                ),
              ),

              //Icon
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.share_outlined, color: primaryColor),
                      onPressed: () {}),
                  IconButton(
                      icon: isplaying? Icon(Icons.pause,
                          color: primaryColor, size: 34):Icon(Icons.play_arrow_outlined,
                          color: primaryColor, size: 34),
                      onPressed: () async{
                      setState(() {
                        isplaying=true;
                      });
                      await audioPlayer.play(verses.audio.primary);
                    
                      }),
                  GetBuilder<BookmarkController>(
                    init: BookmarkController(),
                    builder: (builder) => IconButton(
                      icon: builder.bookmark.contains(verses.number.inQuran)
                          ? Icon(Icons.bookmark, color: primaryColor)
                          : Icon(Icons.bookmark_border, color: primaryColor),
                      onPressed: () {
                        builder.setBookmark(verses.number.inQuran);

                        print(builder.bookmark);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        //Content
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  text: verses.text.arab,
                  style: Theme.of(context)
                      .textTheme
                      .apply(fontSizeDelta: 6)
                      .bodyText2,
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Инчаба точики тафсир мешад\n"+verses.translation.id,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ),
      ],
    );
  }
}
