import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/data/repositories/repositories.dart';

class Attachments extends ConsumerStatefulWidget {
  const Attachments({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  ConsumerState<Attachments> createState() => _AttachmentsState();
}

class _AttachmentsState extends ConsumerState<Attachments> {
  final List<String> _attachments = <String>[];

  @override
  Widget build(BuildContext context) {
    final uploadRepository = ref.watch(uploadRepositoryProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            physics: const ClampingScrollPhysics(),
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
            },
          ),
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

                  if (result != null) {
                    for (var file in result.files) {
                      final response = await uploadRepository.upload(file);

                      // if successful, add the path to attachments
                      if (response != null) {
                        setState(() {
                          _attachments.add(response.path);
                        });
                      }
                    }
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
