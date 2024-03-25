import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widget/app_widget.dart';
import '../home_module/home_page.dart';
import '../profile_module/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  var tabIndex = 0;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 当应用程序从后台切换到前台时
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: kAppTextColor,
        currentIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          setState(() {});
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: MyImage(
                  tabIndex == 0 ? "app_main_selected.png" : "app_main_unselect.png",
                  width: 25,
                  isAssetImage: true),
              label: '首页'.tr),
          BottomNavigationBarItem(
              icon: MyImage(tabIndex == 1 ? "app_mine_selected.png" : "app_mine_unselect.png",
                  width: 25, isAssetImage: true),
              label: '我的'.tr)
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            if (tabIndex == 0) {
              return HomePage();
            }
            return ProfilePage();
          },
        );
      },
    );
  }
}
