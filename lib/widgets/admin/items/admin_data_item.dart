import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/widgets/admin/dialogs/admin_data_edit_dialog.dart';

class AdminDataItem extends StatefulWidget {
  final String item;

  AdminDataItem({required this.item});

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
          name: '${widget.item}',
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
    return Dismissible(
      key: ValueKey(widget.item),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return showCupertinoDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
              title: Text('Deleting...'),
              content: Text('Are You Sure You Want to Delete ${widget.item}?'),
              actions: [
                TextButton(
                    onPressed: () {
                      //TODO delete data Item
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
                        Text('Are You Sure You Want to Edit ${widget.item}?'),
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
              '${widget.item}',
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
