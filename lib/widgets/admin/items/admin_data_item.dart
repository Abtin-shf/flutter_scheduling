import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/models/enums.dart';
import 'package:last_war/providers/admin/admin_data_provider.dart';
import 'package:last_war/widgets/admin/dialogs/admin_data_edit_dialog.dart';
import 'package:provider/provider.dart';

class AdminDataItem extends StatefulWidget {
  final String name;
  final String secondOne;
  final DataType type;
  final String id;

  AdminDataItem(
      {required this.name,
      required this.secondOne,
      required this.type,
      required this.id});

  @override
  _AdminDataItemState createState() => _AdminDataItemState();
}

class _AdminDataItemState extends State<AdminDataItem> {
  bool _isShowing = false;

  void _showEditDialog(ctx) {
    showDialog(
      context: ctx,
      builder: (ct) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        content: AdminDataEditDialog(
          name: '${widget.name}',
          secondOne: '${widget.secondOne}',
          type: widget.type,
          editOrAdd: EditOrAdd.Edit,
          id: widget.id,
        ),
      ),
    );
    setState(() {
      _isShowing = false;
    });
    //Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AdminDataProvider>(context);
    return Dismissible(
      key: ValueKey(widget.name),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return showCupertinoDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
              title: Text('Deleting...'),
              content: Text('Are You Sure You Want to Delete ${widget.name}?'),
              actions: [
                TextButton(
                    onPressed: () {
                      if (widget.type == DataType.Day) {
                        data.deleteDay(widget.id);
                      }
                      if (widget.type == DataType.Bell) {
                        data.deleteBell(widget.id);
                      }
                      if (widget.type == DataType.Course) {
                        data.deleteCourse(widget.id);
                      }
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text('Yes')),
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: Text('No')),
              ],
            ),
          );
        }
        if (direction == DismissDirection.startToEnd) {
          _isShowing = true;
          return !_isShowing
              ? null
              : showCupertinoDialog(
                  context: context,
                  builder: (ctx) => CupertinoAlertDialog(
                    title: Text('Editing'),
                    content:
                        Text('Are You Sure You Want to Edit ${widget.name}?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            _showEditDialog(ctx);
                          },
                          child: Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: Text('No')),
                    ],
                  ),
                );
        }
      },
      background: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).errorColor,
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 40,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            ),
          ),
        ],
      ),
      child: Card(
        elevation: 6,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            backgroundColor: Colors.green,
          ),
          title: Center(
            child: Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blueGrey,
              ),
            ),
          ),
          trailing: CircleAvatar(
            child: Icon(
              Icons.delete,
              color: Colors.black,
            ),
            backgroundColor: Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }
}
