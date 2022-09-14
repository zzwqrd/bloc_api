import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:task_app/helper/custom_show_product.dart';
import 'package:task_app/screens/home/view.dart';
import 'package:task_app/screens/show_product/bloc/bloc.dart';
import 'package:task_app/screens/show_product/bloc/events.dart';
import 'package:task_app/screens/show_product/bloc/states.dart';

class ShowProduct extends StatefulWidget {
  final int id;
  final String name;

  const ShowProduct({super.key, required this.id, required this.name});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  final bloc = KiwiContainer().resolve<BlocShowProduct>();

  @override
  void initState() {
    bloc.add(ShowProductEventStart(id: widget.id));
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
        title: Text(widget.name),
        leading: InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
              (Route<dynamic> route) => false,
            );
            // Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is ShowProductStateStart) {
            return const CircularProgressIndicator();
          } else if (state is ShowProductStateSuccess) {
            return SingleChildScrollView(
              child: CustomShowProduct(
                ontap: () {},
                name: state.model.data.name,
                description: state.model.data.description,
                image: state.model.data.image,
                price: state.model.data.price,
                // priceBeforeDiscount: state.model.data.priceBeforeDiscount,
              ),
            );
          } else if (state is ShowProductStateFailed) {
            return Center(
              child: Text(state.mas),
            );
          } else {
            return Center(
              child: Container(
                width: 30,
                height: 30,
                child: const CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
