import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../home/data/models/CartResponse.dart';
import '../manager/cubit.dart';

class CartItem extends StatelessWidget {
  Products product;

  CartItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 398.w,
        height: 140.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: Color(0x4C004182)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 120.w,
              height: 113.h,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.product!.imageCover ?? ""),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0x4C004182)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              width: 28.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.product?.title?.substring(0, 8) ?? "",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: AppColors.primary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            CartCubit.get(context)
                                .deleteItem(product.product?.id ?? "");
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  Text("Count :${product.count} "),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${product.price} EGP",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 16.sp),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    int counter = product.count ?? 0;
                                    counter--;
                                    CartCubit.get(context).update(
                                        product.product?.id ?? "", counter);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 20,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                product.count.toString() ?? "0",
                                style:
                                TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    int counter = product.count ?? 0;
                                    counter++;
                                    CartCubit.get(context).update(
                                        product.product?.id ?? "", counter);
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    size: 20,
                                    color: Colors.white,
                                  ))
                            ],
                          )),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}