import 'package:emp_app/models/employee.dart';
import 'package:emp_app/services/emp_operations.dart';
import 'package:flutter/material.dart';

class EditEmployee extends StatelessWidget {
  final Employee employee;
  final int index;

  EditEmployee({this.employee, this.index});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = employee.name;
    postController.text = employee.post;
    salaryController.text = employee.salary.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Employee'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Employee Name'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: postController,
              decoration: InputDecoration(hintText: 'Employee Post'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: salaryController,
              decoration: InputDecoration(hintText: 'Employee Salary'),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              child: Text('Edit Employee'),
              onPressed: () {
                String n = nameController.text;
                String p = postController.text;
                int s = int.parse(salaryController.text);

                Employee e = Employee(name: n, post: p, salary: s);
                EmpOperation.editEmployee(e, index);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
