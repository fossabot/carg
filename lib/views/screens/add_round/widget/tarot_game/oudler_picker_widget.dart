import 'package:carg/models/score/misc/tarot_oudler.dart';
import 'package:carg/models/score/round/tarot_round.dart';
import 'package:carg/views/screens/add_round/widget/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OudlerPickerWidget extends StatelessWidget {
  final TarotRound tarotRound;

  const OudlerPickerWidget({Key? key, required this.tarotRound})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: tarotRound,
      child: Consumer<TarotRound>(
          builder: (context, roundData, _) => Column(
                children: [
                  const SectionTitleWidget(title: 'Nombre de bout(s)'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: TarotOudler.values
                          .map((tarotBoutCount) => InputChip(
                              selectedColor:
                                  Theme.of(context).colorScheme.secondary,
                              selected: roundData.oudler == tarotBoutCount,
                              onPressed: () {
                                roundData.oudler = tarotBoutCount;
                              },
                              label: Text(tarotBoutCount.name! +
                                  (roundData.oudler == tarotBoutCount
                                      ? ' (' +
                                          roundData.oudler.pointToDo!
                                              .round()
                                              .toString() +
                                          ')'
                                      : ''))))
                          .toList()
                          .cast<Widget>())
                ],
              )),
    );
  }
}
