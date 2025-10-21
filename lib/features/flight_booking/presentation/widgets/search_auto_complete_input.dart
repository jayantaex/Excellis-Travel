import 'package:flutter/material.dart';
import 'package:reiselab/core/constants/app_styles.dart';

import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../data/search_data.dart';
import '../../models/air_port_model.dart';

class SearchAutoCompleteInput extends StatefulWidget {
  final Function(AirportModel) onSelected;
  final String iconName;
  final String placeHolder;
  final String label;

  const SearchAutoCompleteInput(
      {super.key,
      required this.onSelected,
      required this.iconName,
      required this.placeHolder,
      required this.label});

  @override
  State<SearchAutoCompleteInput> createState() =>
      _SearchAutoCompleteInputState();
}

class _SearchAutoCompleteInputState extends State<SearchAutoCompleteInput> {
  late FocusNode _focusNode;

  final SearchData searchData = SearchData();

  @override
  initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Autocomplete<AirportModel>(
        initialValue: TextEditingValue(text: widget.placeHolder),
        optionsViewOpenDirection: OptionsViewOpenDirection.down,
        displayStringForOption: (option) {
          return '${option.code}(${option.city}) \n${option.name}';
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300,
                  maxWidth:
                      AppHelpers.percenWidth(context: context, percent: 85),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    return ResultCard(data: option, onSelected: onSelected);
                  },
                ),
              ),
            ),
          );
        },
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          return AppPrimaryInput(
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            isMultiline: true,
            keyboardType: TextInputType.text,
            controller: textEditingController,
            focusNode: focusNode,
            maxCharacters: 10,
            hint: widget.placeHolder,
            label: widget.label,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child:
                  AppHelpers.svgAsset(assetName: widget.iconName, isIcon: true),
            ),
          );
        },
        optionsBuilder: (TextEditingValue query) {
          return searchData.searchAirports(query: query.text);
        },
        onSelected: (selectedAirport) {
          widget.onSelected(selectedAirport);
        },
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final AirportModel data;
  final Function(AirportModel) onSelected;
  const ResultCard({super.key, required this.onSelected, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          data.code ?? 'NO-CODE',
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(data.name ?? 'NO-NAME'),
      subtitle: Text(data.city ?? 'NO-CITY'),
      onTap: () => onSelected(data),
    );
  }
}
