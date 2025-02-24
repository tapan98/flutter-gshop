import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gshop/common/widgets/appbar/appbar.dart';
import 'package:gshop/features/personalization/controllers/profile/edit_username_controller.dart';
import 'package:gshop/util/constants/sizes.dart';
import 'package:gshop/util/constants/text_strings.dart';
import 'package:gshop/util/helpers/helper_functions.dart';
import 'package:gshop/util/validators/input_validator.dart';

class EditUsernameScreen extends StatelessWidget {
  const EditUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditUsernameController());
    return Scaffold(
      appBar: const GAppBar(
        title: Text("Edit ${GTexts.username}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                // username TextFormField
                TextFormField(
                  controller: controller.usernameTextController,
                  validator: (value) =>
                      Validator.validateEmptyText(GTexts.username, value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    labelText: GTexts.username,
                  ),
                ),

                HelperFunctions.spaceBtwSectionsHeight(),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.updateUsername,
                    child: Text(GTexts.save.capitalize!),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
