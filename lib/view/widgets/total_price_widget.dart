import 'package:flutter/material.dart';
import 'package:get/get.dart%20';
import 'package:shopping/controllers/cart_controller.dart';

class TotalPriceWidget extends GetView<CartControllerImp> {
  const TotalPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 50,
      decoration: BoxDecoration(
        //color: Colors.amber,
        border: Border.all(width: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  color: Colors.blueGrey.shade50,
                  height: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    'Total Price:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // const Gap(5),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${controller.getTotalPrice()} ' '\$',
                      style: const TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: FilledButton(
              style: TextButton.styleFrom(
                  minimumSize: Size.infinite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
              onPressed: () {},
              child: const Text('Get your products'),
            ),
          ),
        ],
      ),
    );
  }
}
