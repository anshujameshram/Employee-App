import 'package:emp_app/models/employee.dart';
import 'package:emp_app/services/emp_operations.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController nameController=TextEditingController();
  TextEditingController postController=TextEditingController();
  TextEditingController salaryController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Employee name'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: postController,
              decoration: InputDecoration(hintText: 'Employee post'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: salaryController,
              decoration: InputDecoration(hintText: 'Employee salary'),
            ),
            SizedBox(height: 8),
            RaisedButton(
              child: Text('Add Employee'),
              onPressed: () {
                String n=nameController.text;
                String p=postController.text;
                int s=int.parse(salaryController.text);

                Employee e=Employee(name:n,post:p,salary: s);

                EmpOperation.addEmployee(e);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
