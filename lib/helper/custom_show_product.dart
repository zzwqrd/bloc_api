import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:task_app/helper/app_theme.dart';

class CustomShowProduct extends StatelessWidget {
  final dynamic ontap;
  final String name;
  final String description;
  final String image;
  // final double priceBeforeDiscount;
  final double price;

  const CustomShowProduct(
      {super.key,
        this.ontap,
        required this.name,
        required this.description,
        required this.image,
        // required this.priceBeforeDiscount,
        required this.price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Container(

          // padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image,
                width: double.infinity,
                height: 200.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 18.w,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTheme.nameProduct,
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      description,
                      style: AppTheme.descriptionProduct,
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Row(
                      children: [
                        Text(
                          price.toString(),
                          style: AppTheme.nameProduct,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        // Text(
                        //   priceBeforeDiscount.toString(),
                        //   style: AppTheme.priceBeforeDiscountProduct,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
