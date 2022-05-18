import 'package:flutter/material.dart';
import 'package:grecipe/src/data/list.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/ui/view/community_view/community_recipe_add_page.dart';
import 'package:grecipe/src/ui/view/mypage_view/mypage.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: mainColor,
                leading: null,
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: false,
                title: Text(
                  'Grecipe',
                  style:
                      TextStyle(color: subColor, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.location_history),
                    onPressed: () {
                      Get.to(() => const MyPage());
                    },
                  ),
                ],
                bottom: AppBar(
                  shadowColor: mainColor,
                  backgroundColor: mainColor,
                  automaticallyImplyLeading: false,
                  title: Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.white,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for recipe',
                            prefixIcon: Icon(Icons.search, color: mainColor),
                            suffixIcon: IconButton(
                              icon:
                                  Icon(Icons.add_box_rounded, color: mainColor),
                              onPressed: () {
                                Get.to(() => CommunityRecipeAddPage());
                              },
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              // Other Sliver Widgets
              SliverList(
                delegate: SliverChildListDelegate([
                  Center(
                      child: SizedBox(
                          height: displayHeight * 0.35,
                          width: displayWidth * 0.8,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Text(
                                    'Trendy Recipes',
                                    style: TextStyle(
                                        fontSize: displayHeight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                color: mainColor,
                                height: displayHeight * 0.25,
                                /*child: CarouselSlider.builder(
                                itemCount: itemCount,
                                itemBuilder: TrendyRecipeBuilder(
                                    BuildContext(context), itemCount),
                                options: CarouselOptions()),*/
                              ),
                            ],
                          ))),
                  Center(
                      child: Container(
                          width: displayWidth * 0.8,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            'Recent',
                            style: TextStyle(
                                fontSize: displayHeight * 0.02,
                                fontWeight: FontWeight.bold),
                          ))),
                  Center(
                      // 한무 스크롤 가능하게
                      child: Container(
                    height: displayHeight * 1.5,
                    width: displayWidth * 0.8,
                    color: Colors.pink,
                  )),
                ]),
              ),
            ],
          ),
        ));
  }
}
