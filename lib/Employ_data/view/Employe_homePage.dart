import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Utils/global.dart';
import '../Controller/Employe_controller.dart';
import '../modal/Employe_modal.dart';

EmployeController employeController = Get.put(EmployeController());

GlobalKey<FormState> formKey = GlobalKey();

class EmployeeHomepage extends StatelessWidget {
  const EmployeeHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          'Employe Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: employeController.empList.length,
          itemBuilder: (context, index) => Card(
            margin: EdgeInsets.all(12),
            color: Colors.teal.shade100,
            child: ListTile(
              leading: Text(
                employeController.empList[index].employee_id,
                style: TextStyle(fontSize: 15),
              ),
              title: Text(
                employeController.empList[index].name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                employeController.empList[index].position,
                style: TextStyle(fontSize: 20, color: Colors.black38),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Enter Details :'),
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
                                child: const Text(
                                  'Approve',
                                  style: TextStyle(fontSize: 18),
                                ),
                                onPressed: () {
                                  print(index);
                                  employeController.addAtIndex(index, {
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
                                  child: Text(
                                    'Cancle',
                                    style: TextStyle(fontSize: 18),
                                  ))
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        employeController.empList.removeAt(index);
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Form(
                key: formKey,
                child: AlertDialog(
                  title: const Text(
                    'Enter Details ',
                    style: TextStyle(fontSize: 30),
                  ),
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
                        child: const Text(
                          'Approve',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
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
                        }),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancle',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  TextFormField buildTextFormField(
      {required TextEditingController controller, required String label}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.black45, fontWeight: FontWeight.w500, fontSize: 20),
        // enabledBorder: OutlineInputBorder(),
        // focusedBorder: OutlineInputBorder(),
      ),
    );
  }
}
