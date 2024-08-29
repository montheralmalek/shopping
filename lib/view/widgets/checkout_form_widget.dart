import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart%20';
import 'package:shopping/controllers/cart_controller.dart';
import 'package:shopping/view/widgets/custom_textfield.dart';
import 'package:shopping/view/widgets/upload_image_widget.dart';

class CheckoutForm extends GetView<CartControllerImp> {
  const CheckoutForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return SizedBox(
        width: 350,
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                radius: 10,
                labeltext: 'Full Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const Gap(10),
              CustomTextFormField(
                radius: 10,
                labeltext: 'Phone Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Phone Number';
                  }
                  return null;
                },
                inputType: TextInputType.phone,
              ),
              const Gap(10),
              CustomTextFormField(
                radius: 10,
                labeltext: 'Shipping Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Shipping Address';
                  }
                  return null;
                },
              ),
              const Gap(10),
              const Text('Payment method'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('On Delivery'),
                      value: 'On Delivery',
                      groupValue: '',
                      onChanged: (v) {},
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Banck'),
                      value: 'Banck',
                      groupValue: '',
                      onChanged: (v) {},
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Row(
                children: [
                  Expanded(child: UploadImageWidget()),
                ],
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: controller.submitOrder,
                      child: const Text('Submit Order'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
