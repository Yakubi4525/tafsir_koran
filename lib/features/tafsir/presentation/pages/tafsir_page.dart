import 'package:flutter/material.dart';
import 'package:tafsir/features/tafsir/presentation/widgets/home_header.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:tafsir/features/tafsir/presentation/widgets/surah_view.dart';


class TafsirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          "Тафсири Куръон",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              new SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: MediaQuery.of(context).size.height / 4.2,
                flexibleSpace: FlexibleSpaceBar(
                  background: HomeHeader(),
                ),
              ),
              new SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                toolbarHeight: 0,
                bottom: new TabBar(
                  // controller: controller,
                  labelColor: primaryColor,
                  unselectedLabelColor: secondaryColor,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: primaryColor, width: 5),
                  ),
                  labelStyle: Theme.of(context)
                      .textTheme
                      .apply(fontSizeDelta: -4)
                      .bodyText1,
                  tabs: [
                    new Tab(text: 'Тафсир'),
                    new Tab(text: 'Сура'),
                    new Tab(text: 'Чузъ'),
                    new Tab(text: 'Закладки'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SurahView(),
              Center(child: Text("Tab 1")),
              Center(child: Text("Tab 1")),
              Center(child: Text("Tab 1")),
            ],
          ),
        ),
      ),
    );
  }
}