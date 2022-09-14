import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:task_app/helper/app_theme.dart';

class CustomProduct extends StatelessWidget {
  final dynamic ontap;
  final String name;
  final String description;
  final String image;
  // final double priceBeforeDiscount;
  final double price;

  const CustomProduct(
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
          height: 100.h,
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  image.toString(),
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTheme.nameProduct,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                        description,
                      style: AppTheme.descriptionProduct,
                    ),
                    SizedBox(
                      height: 5.h,
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
                        //     priceBeforeDiscount.toString(),
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
