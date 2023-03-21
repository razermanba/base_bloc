import 'package:flutter/material.dart';
import 'package:fimber/fimber.dart';

import 'package:flutter_tree/flutter_tree.dart';
import './tree_data.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  Future<List<TreeNodeData>> _load(TreeNodeData parent) async {
    await Future.delayed(const Duration(seconds: 1));
    final data = [
      TreeNodeData(
        title: 'Load node 1',
        children: [],
        extra: null,
        checked: false,
        expaned: false,
      ),
      TreeNodeData(
        title: 'Load node 2',
        children: [],
        extra: null,
        checked: false,
        expaned: false,
      ),
    ];

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> names = <String>[
      'Topic 1',
      'Topic 2 ',
      'Topic 3',
      'Topic 4',
      'Topic 5'
    ];

    return Drawer(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TreeView(
          data: treeData,
          append: (parent) {
            print(parent.extra);
            return TreeNodeData(
              title: 'Appended',
              children: [],
              expaned: true,
              checked: true,
            );
          },
        ),
      ),
    ));
  }

// return MaterialApp(
// home: Scaffold(
// body: TreeView (
// data: treeData,
// lazy: true,
// load: _load,
// showActions: true,
// showCheckBox: true,
// showFilter: true,
// append: (parent) {
// print(parent.extra);
// return TreeNodeData(
// title: 'Appended',
// children: [],
// expaned: true ,
// checked: true ,
// );
// },
// ),
// )
// );

// Widget buildMenuItem({
//   required String text,
//   required IconData icon
// }) {
//   final color = Colors.blue;
//   final hoverColor = Colors.black;
//
//   return ListTile (
//     leading: Icon(icon, color: color),
//     title: Text(text, style: TextStyle(color: color)),
//     hoverColor: hoverColor,
//     onTap:(){},
//   );
// }
}
