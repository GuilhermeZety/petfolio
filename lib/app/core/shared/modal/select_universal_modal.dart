// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/utils/custom_dialog_utils.dart';
import 'package:petfolio/app/ui/components/button.dart';
import 'package:petfolio/app/ui/components/dialogs/custom_dialog.dart';
import 'package:petfolio/app/ui/components/highlight_text.dart';
import 'package:petfolio/app/ui/components/inputs/input.dart';
import 'package:petfolio/app/ui/components/panel.dart';

enum SelectUniversalModalDataType {
  text, // espeficicando que o dado é texto ou numero
  //
}

class SelectUniversalModal extends StatefulWidget {
  const SelectUniversalModal.custom({super.key, required this.title, this.data = const [], this.showCleanButton = false, required this.visibleData, required this.filterData});

  const SelectUniversalModal.company({super.key, required this.data, this.showCleanButton = false})
    : title = 'Selecione a empresa',
      visibleData = const ['nome', 'data'],
      filterData = const {'nome': SelectUniversalModalDataType.text, 'data': SelectUniversalModalDataType.text};

  const SelectUniversalModal.filial({super.key, required this.data, this.showCleanButton = false})
    : title = 'Selecione a filial',
      visibleData = const ['nome'],
      filterData = const {'nome': SelectUniversalModalDataType.text};

  const SelectUniversalModal.sector({super.key, required this.data, this.showCleanButton = false})
    : title = 'Selecione o setor',
      visibleData = const ['nome'],
      filterData = const {'nome': SelectUniversalModalDataType.text};

  const SelectUniversalModal.subSector({super.key, required this.data, this.showCleanButton = false})
    : title = 'Selecione  o sub setor',
      visibleData = const ['nome'],
      filterData = const {'nome': SelectUniversalModalDataType.text};

  final String title;
  final List<Map<String, dynamic>> data;
  final List<String> visibleData;
  final Map<String, SelectUniversalModalDataType> filterData;
  final bool showCleanButton;

  Future show(BuildContext context) async {
    return showCustomDialog(
      context,
      child: CustomDialog(
        top: Text(title, style: context.textTheme.bodyLarge),

        bottom: Column(
          children: [
            if (showCleanButton) Button.secondary(onPressed: () async => Modular.to.pop(false), child: const Text('Limpar')).pBottom(8).expandedH(),
            Button(onPressed: () async => Modular.to.pop(), child: const Text('Fechar')).expandedH(),
          ],
        ),
        child: this,
      ),
    );
  }

  @override
  State<SelectUniversalModal> createState() => _SelectUniversalModalState();
}

class _SelectUniversalModalState extends State<SelectUniversalModal> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> get filteredData {
    final data = widget.data;
    final query = searchController.text.toLowerCase();

    if (query.isNotEmpty) {
      return data.where((item) {
        return widget.filterData.keys.any((key) {
          final value = item[key]?.toString().toLowerCase() ?? '';
          return value.contains(query);
        });
      }).toList();
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final list = filteredData;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Input.search(
            searchController,
            onChange: (_) {
              if (mounted) setState(() {});
            },
          ),
          const Gap(10),
          Column(
            spacing: 4,
            children:
                list
                    .map(
                      (item) =>
                          Panel(
                            color: context.colorScheme.primaryContainer,
                            withShadow: false,
                            onTap: () => Navigator.pop(context, item),
                            border: Border.all(color: AppColors.primary.changeOpacity(0.3)),
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      List.generate(
                                        widget.visibleData.length,

                                        (index) => HighlightText(
                                          text: item[widget.visibleData[index]].toString(),
                                          query: searchController.text,
                                          normalStyle: context.textTheme.bodyLarge?.copyWith(fontSize: 14, color: context.isDark ? AppColors.grey_300 : AppColors.grey_600),
                                          highlightStyle: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
                                        ),
                                      ).toList(),
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded, size: 16, color: context.isDark ? AppColors.grey_300 : AppColors.grey_600),
                              ],
                            ),
                          ).expandedH(),
                    )
                    .toList(),
          ),
          if (list.isEmpty)
            Panel(
              withShadow: false,
              color: context.colorScheme.tertiaryContainer,
              child: const Center(child: Text('Nenhum Produto Encontrado', style: TextStyle(fontSize: 14, color: AppColors.grey_600))),
            ).pTop(10),
        ],
      ),
    );
  }
}
