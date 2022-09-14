import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:kiwi/kiwi.dart';
import 'package:task_app/helper/custom_cart_product.dart';
import 'package:task_app/helper/text_form.dart';
import 'package:task_app/screens/search/bloc/bloc.dart';
import 'package:task_app/screens/search/bloc/events.dart';
import 'package:task_app/screens/search/bloc/states.dart';
import 'package:task_app/screens/search/widget/search_head.dart';
import 'package:task_app/screens/show_product/view.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final bloc = KiwiContainer().resolve<BlocSearch>()..add(SearchEventStart());
  final TextEditingController textEditingController = TextEditingController();

  bool isSearch = false;

  Offset offset = Offset.zero;

  String? keyWord;

  @override
  void initState() {
    bloc.add(SearchEventStart());
    bloc.keyWord = keyWord;
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
        title: Text("Search"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SearchHead(
            controller: textEditingController,
            onChanged: (val) {
              setState(() {
                bloc.keyWord = textEditingController.text.toString();
                bloc.add(SearchEventStart());
              });
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              textEditingController.text.isEmpty
                  ? searchHereCard(context)
                  : BlocBuilder(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is SearchStateStart) {
                          return Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 60,
                                  child: const CircularProgressIndicator()));
                        } else if (state is SearchStateSuccess) {
                          if (state.model.data.isEmpty) {
                            return const Center(
                                child: Text("No provider found"));
                          } else {
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                // vertical: 10,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.model.data.length,
                              itemBuilder: (context, index) {
                                return CustomProduct(
                                  ontap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowProduct(
                                      id: state.model.data[index].id,
                                      name: state.model.data[index].name,
                                    )));
                                  },
                                  name: state.model.data[index].name,
                                  description: state.model.data[index].description,
                                  image: state.model.data[index].image,
                                  price: state.model.data[index].price,
                                  // priceBeforeDiscount: state.model.data[index].priceBeforeDiscount,

                                );
                              },
                            );
                          }
                        } else if (state is SearchStateFailed) {
                          return Center(
                            child: Text(state.mas),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget searchHereCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .8,
      child: const Center(
        child: Text(
          "search here",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

