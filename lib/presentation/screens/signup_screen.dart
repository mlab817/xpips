import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pips/application/app_router.dart';
import 'package:pips/presentation/controllers/offices_controller.dart';
import 'package:pips/presentation/controllers/signupscreen_controller.dart';
import 'package:pips/presentation/widgets/loading_dialog.dart';

import '../../domain/models/office.dart';

@RoutePage()
class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Office? _office;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    debugPrint(ref.watch(signupScreenControllerProvider).toString());
    debugPrint(ref.watch(officesControllerProvider).toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: width <= 400 ? width : 400,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: ref
                                .watch(signupScreenControllerProvider)
                                .firstName,
                            decoration: const InputDecoration(
                              label: Text('First Name'),
                            ),
                            onChanged: (String? value) {
                              ref
                                  .read(signupScreenControllerProvider.notifier)
                                  .update(firstName: value);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Last Name'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Position/Designation'),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email Address'),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Contact Number'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return OfficeBottomSheet(
                                onSelect: (Office? office) {
                              // set the office
                              setState(() {
                                _office = office;
                              });
                              Navigator.of(context).pop();
                            });
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Text(
                              _office != null ? _office!.name : 'Select Office',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.apply(
                                      color: Theme.of(context).primaryColor),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Authorization Form'),
                      ),
                    ),
                    // TODO: add fields
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              onPressed: () {}, child: const Text('Sign up'))),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            AutoRouter.of(context).push(const LoginRoute());
                          },
                          child: const Text('Back to Login'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OfficeBottomSheet extends ConsumerWidget {
  const OfficeBottomSheet({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final Function(Office? office) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueAsync = ref.watch(filteredOfficesControllerProvider);

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: TextField(
          onChanged: (String? value) {
            ref.read(officeFilterProvider.notifier).state = value;
          },
        ),
      ),
      Expanded(
        child: valueAsync.when(
          data: (data) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: data.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data.data[index].acronym),
                    subtitle: Text(data.data[index].name),
                    onTap: () {
                      ref
                          .read(signupScreenControllerProvider.notifier)
                          .update(officeId: data.data[index].id);
                      // handleTap
                      onSelect(data.data[index]);
                    },
                  );
                });
          },
          error: (error, _) => Center(
            child: Text(error.toString()),
          ),
          loading: () {
            return const Center(
              child: LoadingOverlay(),
            );
          },
        ),
      )
    ]);
  }
}
