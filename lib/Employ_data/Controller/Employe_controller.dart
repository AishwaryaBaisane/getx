import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modal/Employe_modal.dart';

class EmployeController extends GetxController
{
  RxList<EmployeeModal> empList = <EmployeeModal>[].obs;

  void addEmploye(Map m1)
  {
    // EmployeModal u1 = EmployeModal.fromJson(m1);
    empList.add(EmployeeModal.fromJson(m1));
    print(empList);
  }
  void addAtIndex(int index, Map m1)
  {
    empList.removeAt(index);
    empList.insert(index,EmployeeModal.fromJson(m1));
    print(empList);
  }
}
