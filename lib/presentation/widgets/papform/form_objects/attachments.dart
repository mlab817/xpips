import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Attachments extends StatefulWidget {
  const Attachments({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  State<Attachments> createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
  final List<String> _attachments = <String>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: _attachments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  title: Text(_attachments[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _attachments.removeAt(index);
                      });
                    },
                  ),
                );
              }),
          Row(
            children: [
              TextButton(
                onPressed: () async {
                  final FilePickerResult? result =
                  await FilePicker.platform.pickFiles(
                    dialogTitle: 'Select File',
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                    allowMultiple: true,
                  );

                  // handle file upload
                  if (result != null) {
                    List<String> names =
                    result.names.map((name) => name!).toList();

                    setState(() {
                      _attachments.addAll(names);
                    });
                  }
                },
                child: const Text('Attach Files'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
