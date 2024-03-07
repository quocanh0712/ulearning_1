import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_1/common/entities/entities.dart';
import 'package:ulearning_1/common/routes/names.dart';
import 'package:ulearning_1/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_1/pages/home/bloc/home_page_states.dart';
import 'package:ulearning_1/pages/home/home_controller.dart';
import 'package:ulearning_1/pages/home/widgets/home_page_widgets.dart';

import '../../common/values/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  late UserItem userProfile;
  void initState() {
    super.initState();
    //_homeController = HomeController(context: context);
    //_homeController.init();

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile!;
  }

  Widget build(BuildContext context) {
    return userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(userProfile.avatar.toString()),
            body: BlocBuilder<HomePageBlocs, HomePageStates>(
              builder: (context, state)  {
                if(state.courseItem.isEmpty){
                   HomeController(context: context).init();
                }
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                  child: CustomScrollView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    slivers: [
                      SliverToBoxAdapter(
                        child: homePageText(
                          "Hello",
                          color: AppColors.primaryThrirdElementText,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: homePageText(
                          userProfile!.name!,
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 20.h),
                      ),
                      SliverToBoxAdapter(
                        child: searchView(),
                      ),
                      SliverToBoxAdapter(
                        child: slidersView(context, state),
                      ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 0.w),
                        sliver: SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1.6),
                          delegate: SliverChildBuilderDelegate(
                              childCount: state.courseItem.length,
                              (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.COURSE_DETAIL,
                                    arguments: {
                                      "id": state.courseItem.elementAt(index).id
                                    });
                              },
                              child: courseGrid(state.courseItem[index]),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
