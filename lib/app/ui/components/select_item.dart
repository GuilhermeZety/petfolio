// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/ui/components/panel.dart';

class SelectItemItem {
  final String title;
  final Function() onTap;
  final double fontSize;

  SelectItemItem({required this.title, required this.onTap, this.fontSize = 14});
}

class SelectItem extends StatelessWidget {
  const SelectItem({super.key, required this.itens, this.index, this.itemsVisible = 2});

  final List<SelectItemItem> itens;
  final int? index;
  final double itemsVisible;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final Duration anitionDuration = 200.ms;
    bool selected(SelectItemItem item) => index == itens.indexOf(item);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Panel(
          padding: EdgeInsets.zero,
          radius: BorderRadius.circular(10),
          child: SingleChildScrollView(
            controller: scrollController,
            // physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Stack(
              children: [
                if (index != null)
                  AnimatedContainer(
                    duration: anitionDuration,
                    curve: Curves.fastOutSlowIn,
                    width: (constraints.maxWidth / itemsVisible),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: index == 0 ? const Radius.circular(10) : Radius.zero,
                        bottomLeft: index == 0 ? const Radius.circular(10) : Radius.zero,
                        topRight: index == itemsVisible - 1 ? const Radius.circular(10) : Radius.zero,
                        bottomRight: index == itemsVisible - 1 ? const Radius.circular(10) : Radius.zero,
                      ),
                    ),
                    height: 60,
                    margin: EdgeInsets.only(left: (constraints.maxWidth / itemsVisible) * index!),
                    child: const Text(''),
                  ),
                Row(
                  children: [
                    ...itens.map(
                      (e) => GestureDetector(
                        onTap: () {
                          e.onTap.call();
                        },
                        child: AnimatedContainer(
                          duration: anitionDuration,
                          // padding: EdgeInsets.all(20),
                          width: constraints.maxWidth / itemsVisible,
                          decoration: const BoxDecoration(color: Colors.transparent),
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            e.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            minFontSize: 6,
                            style: TextStyle(fontWeight: FontWeight.bold, color: selected(e) ? AppColors.white : AppColors.grey_300),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
