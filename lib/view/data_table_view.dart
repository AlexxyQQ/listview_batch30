import 'package:flutter/material.dart';
import 'package:listview_batch30/model/student.dart';
import 'package:listview_batch30/state/student_state.dart';

class DataTableView extends StatefulWidget {
  const DataTableView({Key? key}) : super(key: key);

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  void _showAlert(String msg, {int? index}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(msg),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () {
                if (index != null) {
                  StudentState.listSts.removeAt(index);
                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: const Text('YES'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('NO'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Table"),
      ),
      // body: Placeholder(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            border: TableBorder.all(color: Colors.black),
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.amber),
            columns: buildColumns(),
            rows: buildRows(),
          ),
        ),
      ),
    );
  }

  List<DataColumn> buildColumns() {
    return [
      const DataColumn(label: Text('First Name')),
      const DataColumn(label: Text('Last Name')),
      const DataColumn(label: Text('Age')),
      const DataColumn(label: Text('Gender')),
      const DataColumn(label: Text('Address')),
      const DataColumn(label: Text('City')),
      const DataColumn(label: Text('Action')),
    ];
  }

  List<DataRow> buildRows() {
    return StudentState.listSts.map((student) {
      return DataRow(
        cells: [
          DataCell(
            Center(
              child: Text(
                student.fname.toString(),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                student.lname.toString(),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                student.age.toString(),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                student.gender.toString(),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                student.address.toString(),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                student.city.toString(),
              ),
            ),
          ),
          DataCell(
            Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: student,
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    _showAlert(
                      "Do you want to delete this student?",
                      index: StudentState.listSts.indexOf(student),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      );
    }).toList();
  }
}
