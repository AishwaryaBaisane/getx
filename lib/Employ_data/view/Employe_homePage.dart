import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Employe_controller.dart';
import '../modal/Employe_modal.dart';

EmployeController employeController = Get.put(EmployeController());

GlobalKey<FormState> formKey = GlobalKey();

class EmployeeHomepage extends StatelessWidget {
  const EmployeeHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Employe Data'),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: employeController.empList.length,
            itemBuilder: (context, index) => ListTile(
              leading:
                  Text(employeController.empList[index].employee_id.toString()),
              title: Text(employeController.empList[index].name),
              subtitle: Text(employeController.empList[index].position),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Enter Employee Details'),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildTextFormField(
                                      controller: txtName, label: 'Name'),
                                  buildTextFormField(
                                      controller: txtId, label: 'Id'),
                                  buildTextFormField(
                                      controller: txtPosition,
                                      label: 'Position'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Approve'),
                                onPressed: () {
                                  print(index);
                                  employeController.addAtIndex(index ,{
                                    'employee_id': txtId.text,
                                    'name': txtName.text,
                                    'position': txtPosition.text,
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancle'))
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(onPressed: () {
                    employeController.empList.removeAt(index);
                  }, icon: Icon(Icons.delete))
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return Form(
                  key: formKey,
                  child: AlertDialog(
                    title: const Text('Enter Employee Details'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildTextFormField(controller: txtName, label: 'Name'),
                          buildTextFormField(controller: txtId, label: 'Id'),
                          buildTextFormField(
                              controller: txtPosition, label: 'Position'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Approve'),
                        onPressed: () {
                          bool data = formKey.currentState!.validate();
                         if(data)
                           {
                             Map m1 = {
                               'employee_id': txtId.text,
                               'name': txtName.text,
                               'position': txtPosition.text,
                             };
                             employeController.addEmploye(m1);
                             txtName.clear();
                             txtId.clear();
                             txtPosition.clear();
                             Navigator.pop(context);
                           }
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancle'))
                    ],
                  ),
                );
              },
            );
            // employeController.addEmploye()
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      {required TextEditingController controller, required String label}) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        } else {
          return null;
        }
      },
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        // enabledBorder: OutlineInputBorder(),
        // focusedBorder: OutlineInputBorder(),
      ),
    );
  }
}


