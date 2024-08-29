import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopping/view/widgets/custom_textfield.dart';

class CheckoutForm extends StatelessWidget {
  const CheckoutForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Form(
        // key: _formKey,
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
                    title: const Text('main'),
                    value: 'Cash',
                    groupValue: '', //controller.subjectHierarchy,
                    onChanged: (v) {}, //controller.onChangeHierarchy
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('branch'),
                    value: 'Banck',
                    groupValue: '', //controller.subjectHierarchy,
                    onChanged: (v) {}, // controller.onChangeHierarchy
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   // Process order
                      // }
                    },
                    child: const Text('Submit Order'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
