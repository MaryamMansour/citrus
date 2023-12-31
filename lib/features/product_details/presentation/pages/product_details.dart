import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/domain/entities/ProductEntity.dart';

class ProductDetails extends StatelessWidget {
  ProductDataEntity productEntity;

  ProductDetails(this.productEntity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColors.primary),
        centerTitle: true,
        title: Text(
          "Product Details",
          style: GoogleFonts.quicksand(
              fontSize: 20.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: AppColors.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: AppColors.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                        color: AppColors.primary.withOpacity(.3),
                        width: 2.w)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    productEntity.images?.first ?? "",
                    height: 300.h,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      productEntity.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: AppColors.primary),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                    height: 34.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                            width: 1.h,
                            color: AppColors.primary.withOpacity(.3))),
                    child: Center(
                      child: Text(
                        "${productEntity.sold.toString()} sold",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: AppColors.primary),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.lemon,
                    size: 15.h,
                  ),
                  Text(
                    ' ${productEntity.ratingsAverage.toString()} (${productEntity.ratingsQuantity.toString()})',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.primary),
                  ),
                  SizedBox(
                    width: 66.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 11.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              width: 22.r,
                              height: 22.r,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(11.r)),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.white),
                          ),
                          InkWell(
                            child: Container(
                              width: 22.r,
                              height: 22.r,
                              decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(11.r)),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: const Color(0xff06004F)),
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   isExpanded = !isExpanded;
                  // });
                },
                child: Text(
                  productEntity.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  // maxLines: isExpanded ? 10 : 3,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.primary.withOpacity(.6)),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Total Price',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color:AppColors.primary.withOpacity(.6))),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'EGP ${productEntity.price.toString()}',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 32.w)),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.add_shopping_cart_outlined),
                            SizedBox(
                              width: 26.w,
                            ),
                            Text(
                              'Add to cart',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}