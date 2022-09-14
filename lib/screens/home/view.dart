import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kiwi/kiwi.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:task_app/generated/locale_keys.g.dart';
import 'package:task_app/helper/app_theme.dart';
import 'package:task_app/helper/btn.dart';
import 'package:task_app/helper/custom_cart_product.dart';
import 'package:task_app/helper/pagination_footer.dart';
import 'package:task_app/helper/pagination_header.dart';
import 'package:task_app/screens/home/bloc/bloc.dart';
import 'package:task_app/screens/home/bloc/events.dart';
import 'package:task_app/screens/home/bloc/states.dart';
import 'package:task_app/screens/home/bloc_delete/bloc.dart';
import 'package:task_app/screens/home/bloc_delete/events.dart';
import 'package:task_app/screens/home/bloc_delete/states.dart';
import 'package:task_app/screens/search/view.dart';
import 'package:task_app/screens/show_product/view.dart';
import 'package:task_app/screens/store_product/view.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = KiwiContainer().resolve<BlocProducts>()
    ..add(ProductsEventStart());
  final blocDelete = KiwiContainer().resolve<BlocDelete>();

  @override
  void initState() {
    // bloc.add(ProductsEventStart());
    // bloc.add(ProductsEventStart());
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.title_name).tr(),
      ),
      body: SmartRefresher(
        controller: bloc.refreshController,
        onRefresh: bloc.onRefresh,
        onLoading: bloc.onLoading,
        enablePullUp: bloc.tempList == null ? false : true,
        header: const PaginationHeader(),
        footer: PaginationFooter(
          controller: bloc.refreshController,
          isMoreFounded: bloc.tempList != null && bloc.tempList!.isNotEmpty,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchView()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      // vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        const Spacer(),
                        Text(
                          "Search Product",
                          style: AppTheme.appStayle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder(
                  bloc: bloc,
                  builder: (context, state) {
                    return bloc.products.isEmpty
                        ? Center(
                            child: Text(
                              'لا يوجد منتجات',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: bloc.products.length,
                            itemBuilder: (context, index) {
                              return CustomProduct(
                                ontap: () {
                                  // blocDelete.add(DeleteEventStart(id: bloc.products[index].id));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShowProduct(
                                        id: bloc.products[index].id,
                                        name: bloc.products[index].name,
                                      ),
                                    ),
                                  );
                                },
                                name: bloc.products[index].name,
                                description: bloc.products[index].description,
                                image: bloc.products[index].image,
                                price: bloc.products[index].price,
                                // priceBeforeDiscount:
                                //     bloc.products[index].priceBeforeDiscount,
                              );
                            },
                          );
                  }),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Btn(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StoreProduct()));
        },
        txt: 'Add Products',
      ),
    );
  }
}
