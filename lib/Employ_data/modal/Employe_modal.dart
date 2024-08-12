import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeModal  {
  late String employee_id,name,position;

  EmployeeModal({
    required this.employee_id,
    required this.name,
    required this.position,
  });

  factory EmployeeModal.fromJson(Map m1) {
    return EmployeeModal(
        employee_id: m1['employee_id'],
        name: m1['name'],
        position: m1['position']);
  }
}
TextEditingController txtId = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtPosition = TextEditingController();
