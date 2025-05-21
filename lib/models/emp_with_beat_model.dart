import '../network/responses/near_by_emp/near_by_employees_with_beat_response.dart';

class EmployeeWithBeat{
  final EmployeeData employee;
  final BeetData beat;

  EmployeeWithBeat({required this.employee, required this.beat});
}