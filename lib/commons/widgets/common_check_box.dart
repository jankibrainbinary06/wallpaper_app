// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpaperapp/utils/colorRes.dart';

class CommonCheckBoxWidget extends StatelessWidget {
  final List list;
  final RxList selectedList;
  final void Function(String)? onChange;

  const CommonCheckBoxWidget({
    super.key,
    required this.list,
    required this.selectedList, this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    // final jobFlowController = Get.find<JobFlowSummaryController>();
    final double width = MediaQuery.of(context).size.width;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final double height = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: list.length + 1,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Obx(
              () => Transform.scale(
                scale: orientation == Orientation.portrait && Get.width > 500 ||
                    orientation == Orientation.landscape && Get.height > 600 ?1.6 : 0.8,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // contentPadding: EdgeInsets.zero,
                  checkColor: Colors.white,
                  activeColor: ColorRes.white,
                  // controlAffinity: ListTileControlAffinity.leading,
                  // checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  value: selectedList.value[index],
                  onChanged: (val) {
                    selectedList.value[index] = val;
                    selectedList.refresh();

                    // for(int i=0; i < selectedList.value.length; i++ )
                    //   {
                    //     if(selectedList.value[i] == true)
                    //     {
                    //       if(selectedList.value[(selectedList.value.length-1)] == true) {
                    //         //  other field validation
                    //         // jobFlowController.isFunctionalWorkAreaValidate.value = true;
                    //       }
                    //       else{
                    //         jobFlowController.isFunctionalWorkAreaValidate.value = true;
                    //       }
                    //     }
                    //     else{
                    //       jobFlowController.isFunctionalWorkAreaValidate.value = false;
                    //       jobFlowController.functionalWorkAreaErrorMsg.value = Strings.enterFunctionalWorkArea;
                    //     }
                    //   }


                    // jobFlowController.isFunctionalWorkAreaValidate


                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
