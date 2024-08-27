import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/home_conntroller.dart';
import 'package:shopping/data/models/product_model.dart';
import 'package:shopping/view/widgets/add_to_cart_button.dart';
import 'package:shopping/view/widgets/favorite_icon_button.dart';
import 'package:shopping/view/widgets/rate_product_show_widget.dart';

class ItemCrad extends StatelessWidget {
  const ItemCrad({
    super.key,
    required this.product,
  });
  final ProductModel product;
  final double radius = 8;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImp>(builder: (controller) {
      return LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onTap: () => controller.goToProductScreen(product),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(width: 0.5, color: Colors.grey)),
            child: Column(
              children: [
                //---------- Start item image ------------
                Expanded(
                  flex: 2,
                  child: Container(
                    // padding:const EdgeInsets.all(5),
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          image: NetworkImage(product.img),
                          //fit: BoxFit.,
                        ),
                        //** ------- Favorite Button ----------- */
                        Positioned(
                          top: 5,
                          right: 5,
                          child: FavoriteIconButton(
                            product: product,
                            backgroundColor: Colors.grey.shade100,
                            size: 40,
                            boxShape: BoxShape.circle,
                          ),
                        ),
                        //** ------- Rate Show ----------- */
                        Positioned(
                          bottom: 5,
                          left: 5,
                          child: RateProductShowWidget(
                            rateValue: 4.5,
                            backgroundColor: Colors.grey.shade100,
                          ),
                        ),
                        //** ------- Add To Cart Button ----------- */
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: AddToCartButton(
                            product: product,
                            backgroundColor: Colors.grey.shade100,
                            boxShape: BoxShape.circle,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //---------- End item image ------------------------
                //--------------------------------------------------
                const Gap(5),
                //---------- Start item body -----------------------
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                        // topLeft: Radius.circular(radius),
                        // topRight: Radius.circular(radius),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          product.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Color(0xff666666), fontSize: 14),
                        ),
                        const Gap(8),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${product.price}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                              ),
                            ),
                            const Gap(5),
                            Text(
                              '\$ ${product.price}',
                              style: const TextStyle(
                                fontSize: 14,
                                //color: Colors.greenAccent.shade700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                //---------- End item body ------------
              ],
            ),
          ),
        );
      });
    });
  }
}
