import 'package:flutter/material.dart';
import 'package:listview_batch30/state/student_state.dart';
import 'package:listview_batch30/widgets/custom_card.dart';

class OutputView extends StatefulWidget {
  const OutputView({super.key});

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {
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
        title: const Text('Output View'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: StudentState.listSts.length,
        itemBuilder: (context, index) {
          return KCard(
            title: StudentState.listSts[index].fname!,
            deleteFunction: () {
              _showAlert(
                "Do you want to delete this student?",
                index: index,
              );
            },
          );
          // return Card(
          //   child: ListTile(
          //     leading: CircleAvatar(
          //       child: Text(lstStudents![index].fname![0]),
          //     ),
          //     title: Text(
          //       '${lstStudents![index].fname} ${lstStudents![index].lname}',
          //     ),
          //     subtitle: Text(
          //       '${lstStudents![index].age} years old, ${lstStudents![index].address}, ${lstStudents![index].city}',
          //     ),
          //     trailing: Wrap(
          //       children: [
          //         // Delete Button
          //         IconButton(
          //           onPressed: () {
          //             // show alert dialog before deleting
          //             _showAlert(
          //               "Do you want to delete this student?",
          //               index: index,
          //             );
          //           },
          //           icon: const Icon(Icons.delete),
          //         ),
          //         // Edit Button
          //         IconButton(
          //           onPressed: () {
          //             // Navigate to StudentView with data
          //             Navigator.pushNamed(
          //               context,
          //               '/',
          //               arguments: lstStudents![index],
          //             );
          //           },
          //           icon: const Icon(Icons.edit),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
