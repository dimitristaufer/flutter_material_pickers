// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/list_picker_dialog.dart';
import 'package:flutter_material_pickers/helpers/converter_functions.dart';

void showMaterialNumberPicker({
  BuildContext context,
  String title,
  final int minNumber,
  final int maxNumber,
  final int selectedNumber,
  ValueChanged<int> onChanged,
}) {
  var items = List<String>.generate(
      maxNumber - minNumber + 1, (i) => (i + minNumber).toString());

  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return ListPickerDialog(
        items: items,
        title: title,
        initialItem: selectedNumber.toString(),
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null)
      onChanged(intelligentCast<int>(selection));
  });
}