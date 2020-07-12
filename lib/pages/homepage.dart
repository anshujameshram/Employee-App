import 'package:emp_app/models/employee.dart';
import 'package:emp_app/pages/add_employee.dart';
import 'package:emp_app/pages/edit_employee.dart';
import 'package:emp_app/services/emp_operations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Employee employee = Employee(name: 'Ansh', post: 'manager', salary: 45000);
  @override
  Widget build(BuildContext context) {
    //employeeList.add(employee);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Employee'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddEmployee(),
            ),
          );

          setState(() {
            //
          });
        },
      ),
      body: employeeList.length == 0
          ? Center(
              child: Text('No Employee'),
            )
          : ListView.builder(
              itemCount: employeeList.length,
              itemBuilder: (BuildContext context, int index) {
                Employee e = employeeList[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      e.name[0],
                    ),
                  ),
                  title: Text(e.name),
                  subtitle: Text(
                    '${e.post} (${e.salary})',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          EmpOperation.deleteEmployee(index);

                          setState(() {
                            //
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => EditEmployee(
                                employee: e,
                                index: index,
                              ),
                            ),
                          );

                          setState(() {
                            //
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
