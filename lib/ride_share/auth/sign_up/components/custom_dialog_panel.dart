import 'package:flutter/material.dart';

import '../../../../core/theme/components/rs_color.dart';
import '../../../../widgets/custom_button.dart';
customDialogPanel(context, TextEditingController panelController,Function() onClickSubmit){
  String? selectedOption;
  bool showDeveloperOption=false;
  int showDeveloperOptionCount=0;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      // Using StatefulBuilder to manage the dialog's state
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 12),
            child: Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.zero,
                  color: RsColor.primaryFirst,
                  child: Container(
                    decoration: BoxDecoration(
                      color: RsColor.primaryFirst,
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 6),
                          child: Text(
                              "Choose Ride Share Status?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall),
                        ),
                        Visibility(
                          visible: showDeveloperOption,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              visualDensity:
                              VisualDensity.compact,
                              title: Text("Developer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      fontWeight:
                                      FontWeight
                                          .bold)),
                              trailing: Radio<String>(
                                materialTapTargetSize:
                                MaterialTapTargetSize
                                    .shrinkWrap,
                                value: "Developer",
                                overlayColor: MaterialStateProperty.all(RsColor.primarySecond.withOpacity(0.5)),
                                fillColor: MaterialStateProperty.all(RsColor.primarySecond),
                                groupValue: selectedOption,
                                onChanged: (String? value) {
                                  setState(() =>
                                  selectedOption = value);
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity:
                            VisualDensity.compact,
                            title: Text("Driver",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                    fontWeight:
                                    FontWeight
                                        .bold)),
                            trailing: Radio<String>(
                              materialTapTargetSize:
                              MaterialTapTargetSize
                                  .shrinkWrap,
                              value: "Driver",
                              overlayColor: MaterialStateProperty.all(RsColor.primarySecond.withOpacity(0.5)),
                              fillColor: MaterialStateProperty.all(RsColor.primarySecond),
                              groupValue: selectedOption,
                              onChanged: (String? value) {
                                setState(() =>
                                selectedOption = value);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity:
                            VisualDensity.compact,
                            title: Text("Passenger",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                    fontWeight:
                                    FontWeight
                                        .bold)),
                            trailing: Radio<String>(
                              materialTapTargetSize:
                              MaterialTapTargetSize
                                  .shrinkWrap,
                              autofocus: true,
                              overlayColor: MaterialStateProperty.all(RsColor.primarySecond.withOpacity(0.5)),
                              fillColor: MaterialStateProperty.all(RsColor.primarySecond),
                              value: "Passenger",
                              groupValue: selectedOption,

                              onChanged: (String? value) {
                                setState(() =>
                                selectedOption = value);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 10,
                              top: 5),
                          child: CustomButton(
                            text: "OKK",
                            onLongPress: (){
                              setState((){
                                showDeveloperOption = true;
                              });
                            },
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall,
                            onPressed: () {
                              showDeveloperOptionCount ++;
                              if(showDeveloperOptionCount > 4){
                                showDeveloperOptionCount = 0;
                                setState((){
                                  showDeveloperOption = true;
                                });
                              }
                              if (selectedOption != null) {
                                panelController.text = selectedOption!;
                                onClickSubmit();
                                Navigator.pop(
                                    context); // Close the dialog
                              } else {
                                // Optional: Show error if nothing selected
                                ScaffoldMessenger.of(
                                    context)
                                    .showSnackBar(SnackBar(
                                    content: Text(
                                        "Please select an option")));
                              }
                            },
                            fullWidth: true,
                            borderRadius: 10,
                            backgroundColor: RsColor
                                .primarySecond
                                .withOpacity(0.6),
                            elevation: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}