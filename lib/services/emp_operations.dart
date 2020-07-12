import 'package:emp_app/models/employee.dart';

class EmpOperation {
  static void addEmployee(Employee e) {
    employeeList.add(e);
  }

  static void deleteEmployee(int index){
    employeeList.removeAt(index);
  }

  static void editEmployee(Employee e,int index){
    employeeList.removeAt(index);
    employeeList.insert(index, e);
  }


}
