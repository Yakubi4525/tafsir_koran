import 'package:flutter/material.dart';
import 'package:tafsir/features/zikr/domain/entities/zikr.dart';
import 'package:tafsir/core/configurator/colors.dart';
import 'package:tafsir/features/zikr/presentation/widgets/slide_page_view_item.dart';

class SliderZikr extends StatefulWidget {
  final List<Zikr> zikr;
  final String pageTittle;

  const SliderZikr({Key key, this.zikr, this.pageTittle}) : super(key: key);
  @override
  _SliderZikrState createState() => _SliderZikrState();
}

class _SliderZikrState extends State<SliderZikr> {
  double currentPage = 0;

  PageController _pageController = PageController();
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.pageTittle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 30, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                itemCount: widget.zikr.length,
                itemBuilder: (BuildContext context, int index) {
                  return SlidePageViewItem(
                    zikr: widget.zikr[index],
                    tasbihFunction: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                  );
                },
                onPageChanged: (value) {
                  setState(
                    () {
                      currentPage = value.toDouble();
                    },
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    widget.zikr.length, (index) => buildDot(index: index)),
              ),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    const kAnimationDuration = Duration(milliseconds: 200);
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : secondaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget buildInk({String title, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
      ),
    );
  }
}
