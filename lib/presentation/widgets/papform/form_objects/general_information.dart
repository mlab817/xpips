import 'package:flutter/material.dart';
import 'package:pips/presentation/widgets/papform/form_objects/regular_program.dart';
import 'package:pips/presentation/widgets/papform/form_objects/total_project_cost.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_description.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_pap.dart';
import 'package:pips/presentation/widgets/papform/form_objects/update_title.dart';
import 'package:pips/presentation/widgets/papform/form_section_header.dart';

import 'implementation_basis.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FormSectionHeader(title: 'General Information'),
        UpdateTitle(uuid: widget.uuid),
        UpdatePap(uuid: widget.uuid),
        RegularProgram(uuid: widget.uuid),
        ImplementationBasis(uuid: widget.uuid),
        UpdateDescription(uuid: widget.uuid),
        TotalProjectCost(uuid: widget.uuid),
      ],
    );
  }
}
