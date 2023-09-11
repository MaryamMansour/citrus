
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/ProductEntity.dart';
import '../manager/cubit.dart';

class ProductItem extends StatelessWidget {
  ProductDataEntity model;

  ProductItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 237.h,
        width: 191.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
                color: AppColors.primary.withOpacity(.3), width: 2.w)),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  child: Image.network(
                    model.imageCover ?? "",
                    height: 128.h,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.title ?? "",
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color:AppColors.primary),
                      ),
                      Text(
                        model.description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color:AppColors.primary),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text(
                            model.price.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: AppColors.primary),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            (model.price ?? 50 - 50).toString(),
                            style: GoogleFonts.poppins(
                                decoration: TextDecoration.lineThrough,
                                decorationColor:
                                AppColors.primary.withOpacity(.6)
                                // Replace with your desired color
                                ,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                color: AppColors.primary.withOpacity(.6)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Review (${model.ratingsAverage})',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: AppColors.primary),
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.lemon,
                            size: 18.h,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    // fav = !fav;
                    // setState(() {});
                  },
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(Icons.favorite_border, color: AppColors.orange,),

                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    HomeCubit.get(context).addToCart(model.id ?? "");
                  },
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: AppColors.primary,
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}