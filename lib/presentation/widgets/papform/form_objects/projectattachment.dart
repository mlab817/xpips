import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/repositories/upload_repository.dart';
import '../../../../domain/entities/models.dart';
import '../../../controllers/fullproject_controller.dart';

class ProjectAttachment extends ConsumerStatefulWidget {
  const ProjectAttachment({
    super.key,
    required this.project,
    required this.options,
  });

  final FullProject project;
  final List<Option> options;

  @override
  ConsumerState<ProjectAttachment> createState() => _ProjectAttachmentState();
}

class _ProjectAttachmentState extends ConsumerState<ProjectAttachment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.project.attachments.length,
            itemBuilder: (context, index) {
              final attachment = widget.project.attachments[index];

              return ListTile(
                  leading: const Icon(Icons.attachment),
                  title: Text(attachment.attachmentType.label),
                  onTap: () async {
                    final urlToOpen = Uri.parse(attachment.attachmentUrl);
                    if (!await launchUrl(urlToOpen)) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Failed to open ${attachment.attachmentUrl}')));
                    }
                  });
            }),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return UploadAttachmentForm(
                        project: widget.project, options: widget.options);
                  }));
                },
                child: const Text('UPLOAD'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UploadAttachmentForm extends ConsumerStatefulWidget {
  const UploadAttachmentForm({
    super.key,
    required this.project,
    required this.options,
  });

  final FullProject project;
  final List<Option> options;

  @override
  ConsumerState<UploadAttachmentForm> createState() =>
      _UploadAttachmentFormState();
}

class _UploadAttachmentFormState extends ConsumerState<UploadAttachmentForm> {
  Option? _attachmentType;
  PlatformFile? _file;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Attachment'),
        actions: [
          FilledButton(
              onPressed: _uploadAttachment,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('UPLOAD')),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Select Attachment Type'),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              final bool selected = _attachmentType == widget.options[index];

              return ListTile(
                title: Text(widget.options[index].label),
                selected: selected,
                leading: Icon(
                  Icons.check_outlined,
                  color: selected
                      ? Theme.of(context).primaryColor
                      : Colors.black12,
                ),
                onTap: () {
                  setState(() {
                    _attachmentType = widget.options[index];
                  });
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: _selectFile,
                  child: const Text('Select File'),
                ),
                Text(_file?.name ?? 'NO FILE'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
      ],
    );

    if (result != null) {
      setState(() {
        _file = result.files.first;
      });
    }
  }

  Future<void> _uploadAttachment() async {
    if (_file == null || _attachmentType == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await ref.read(uploadRepositoryProvider).attach(
            widget.project.uuid,
            // result.files.first,
            _file!,
            _attachmentType!,
          );

      ref
          .read(fullProjectControllerProvider(widget.project.uuid).notifier)
          .addAttachment(response.data);

      setState(() {
        _attachmentType = null;
        _file = null;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Success'),
        ));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
