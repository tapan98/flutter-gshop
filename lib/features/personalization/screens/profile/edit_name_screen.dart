import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/personalization/controllers/profile/edit_name_controller.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/validators/input_validator.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditNameController());
    return Scaffold(
      appBar: const GAppBar(
        title: Text(GTexts.editDisplayName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                // First Name
                TextFormField(
                  controller: controller.firstNameTextController,
                  validator: (value) =>
                      Validator.validateEmptyText(GTexts.firstName, value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: GTexts.firstName,
                  ),
                ),

                HelperFunctions.spaceBtwInputFieldsHeight(),

                // Last Name
                TextFormField(
                  controller: controller.lastNameTextController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: GTexts.lastName,
                  ),
                ),

                HelperFunctions.spaceBtwSectionsHeight(),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.updateName,
                    child: Text(GTexts.save.capitalize!),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
