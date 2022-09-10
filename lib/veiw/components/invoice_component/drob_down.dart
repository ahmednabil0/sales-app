import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';
import 'package:new_app/veiw_model/invoces/edit_veiw_model.dart';
import 'package:new_app/veiw_model/rent_invoices/rent_invoice_veiw_model.dart';
import 'package:new_app/veiw_model/reyurns_invoice/return_invoice_view_model.dart';

SizedBox buildDrobDown({required InvoiceVeiwModel controller}) {
  return SizedBox(
    width: Get.width * 0.85,
    child: DropdownSearch<String>(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          if (controller.selectedList.isEmpty) {
            return '38'.tr;
          }

          return null;
        },
        clearButtonProps: const ClearButtonProps(
            color: AppColors.primaryColor,
            isVisible: true,
            icon: Icon(Icons.clear_rounded)),
        popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            title: AppText(
              txt: 'ابحث عن اسم العميل',
              size: Get.width * 0.045,
              fw: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            menuProps: const MenuProps(elevation: 25)),
        items: controller.afterList.isEmpty ? [] : controller.afterList,
        onChanged: (value) {
          controller.oncganged(value);
        },
        enabled: true,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: Get.width * 0.035,
              fontWeight: FontWeight.w800,
            ),
            prefixIcon: const Icon(
              Icons.person,
              color: AppColors.primaryColor,
            ),
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: Get.width * 0.04),
            hintText: '20'.tr,
          ),
        ),
        selectedItem: controller.intailData),
  );
}

SizedBox buildDrobDownRetun({required ReturnIvoiceVeiwModel controller}) {
  return SizedBox(
    width: Get.width * 0.85,
    child: DropdownSearch<String>(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          if (controller.selectedList.isEmpty) {
            return '38'.tr;
          }

          return null;
        },
        clearButtonProps: const ClearButtonProps(
            color: AppColors.primaryColor,
            isVisible: true,
            icon: Icon(Icons.clear_rounded)),
        popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            title: AppText(
              txt: 'ابحث عن اسم العميل',
              size: Get.width * 0.045,
              fw: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            menuProps: const MenuProps(elevation: 25)),
        items: controller.afterList.isEmpty ? [] : controller.afterList,
        onChanged: (value) {
          controller.oncganged(value);
        },
        enabled: true,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: Get.width * 0.035,
              fontWeight: FontWeight.w800,
            ),
            prefixIcon: const Icon(
              Icons.person,
              color: AppColors.primaryColor,
            ),
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: Get.width * 0.04),
            hintText: '20'.tr,
          ),
        ),
        selectedItem: controller.intailData),
  );
}

SizedBox buildDrobDown2({required EditViewModel controller}) {
  return SizedBox(
    width: Get.width * 0.8,
    child: DropdownSearch<String>(
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '5'.tr;
        }
        if (controller.selectedList.isEmpty) {
          return '38'.tr;
        }

        return null;
      },
      clearButtonProps: const ClearButtonProps(
          color: Colors.red, isVisible: true, icon: Icon(Icons.clear_rounded)),
      popupProps: PopupProps.menu(
          showSearchBox: true,
          showSelectedItems: true,
          title: AppText(
            txt: 'ابحث عن اسم العميل',
            size: Get.width * 0.042,
            fw: FontWeight.bold,
            color: Colors.red,
          ),
          menuProps: const MenuProps(elevation: 25)),
      items: controller.afterList.isEmpty ? [] : controller.afterList,
      onChanged: (value) {
        controller.oncganged(value);
      },
      enabled: true,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: Get.width * 0.032,
            fontWeight: FontWeight.w800,
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: AppColors.primaryColor,
          ),
          hintStyle: TextStyle(color: Colors.grey, fontSize: Get.width * 0.032),
          hintText: '20'.tr,
        ),
      ),
      selectedItem: controller.intailData,
    ),
  );
}

SizedBox buildDrobDown3({required RentInvoiceViewModel controller}) {
  return SizedBox(
    width: Get.width * 0.85,
    child: DropdownSearch<String>(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }

          return null;
        },
        clearButtonProps: const ClearButtonProps(
            color: AppColors.primaryColor,
            isVisible: true,
            icon: Icon(Icons.clear_rounded)),
        popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            title: AppText(
              txt: 'ابحث عن اسم العميل',
              size: Get.width * 0.045,
              fw: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
            menuProps: const MenuProps(elevation: 25)),
        items: controller.afterList.isEmpty ? [] : controller.afterList,
        onChanged: (value) {
          controller.oncganged(value);
        },
        enabled: true,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: Get.width * 0.035,
              fontWeight: FontWeight.w800,
            ),
            prefixIcon: const Icon(
              Icons.person,
              color: AppColors.primaryColor,
            ),
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: Get.width * 0.04),
            hintText: '20'.tr,
          ),
        ),
        selectedItem: controller.intailData),
  );
}
