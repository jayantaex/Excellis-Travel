import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';

Future<void> addExtraBaggageSheet(
    {required BuildContext context, required Function onDone}) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) => ExtraBaggageSheet(onDone: onDone),
  );
}

class ExtraBaggageSheet extends StatefulWidget {
  final Function onDone;
  const ExtraBaggageSheet({super.key, required this.onDone});

  @override
  State<ExtraBaggageSheet> createState() => _ExtraBaggageSheetState();
}

class _ExtraBaggageSheetState extends State<ExtraBaggageSheet> {
  final List<Map> _listOfBaggage = [
    {"title": "Additional 3 KG", "price": 1950, 'category': '3kg'},
    {"title": "Additional 5 KG", "price": 2950, 'category': '5kg'},
    {"title": "Additional 7 KG", "price": 2950, 'category': '7kg'},
    {"title": "Additional 10 KG", "price": 3950, 'category': '10kg'},
    {"title": "Additional 15 KG", "price": 4950, 'category': '15kg'},
    {"title": "Additional 20 KG", "price": 5950, 'category': '20kg'},
  ];

  final List<int> _addedBaggage = [];
  final List<Map> _selectedBaggage = [];
  int totalBaggageQty = 0;

  @override
  void initState() {
    _listOfBaggage.map((e) => _addedBaggage.add(0)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 40),
      width: AppHelpers.getScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              const Text(
                'Add extra Check-in Baggage',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.grey,
                  ))
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.5,
          ),
          const SizedBox(height: 15),
          ..._listOfBaggage.map(
            (e) => ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.grey.withOpacity(0.1),
                child: AppHelpers.svgAsset(
                  assetName: 'baggage',
                  isIcon: true,
                ),
              ),
              title: Text(e['title']),
              subtitle: Text('\$${e['price']}'),
              trailing: SizedBox(
                height: 45,
                width: 120,
                child: InCrementDecrementButton(
                  value: _addedBaggage[_listOfBaggage.indexOf(e)],
                  onDecrement: () {
                    int value = _addedBaggage[_listOfBaggage.indexOf(e)];
                    if (value > 0) {
                      value--;
                      totalBaggageQty--;
                      setState(() {
                        _addedBaggage[_listOfBaggage.indexOf(e)] = value;
                      });
                    }
                  },
                  onIncrement: () {
                    if (totalBaggageQty == 2) {
                      return;
                    }
                    int value = _addedBaggage[_listOfBaggage.indexOf(e)];

                    if (value < 2) {
                      totalBaggageQty++;
                      value++;
                      setState(() {
                        _addedBaggage[_listOfBaggage.indexOf(e)] = value;
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 55),
          AppPrimaryButton(
            title: 'Done',
            isLoading: false,
            onPressed: () {
              double totalCost = 0;
              for (int i = 0; i < _addedBaggage.length; i++) {
                if (_addedBaggage[i] > 0) {
                  totalCost += _addedBaggage[i] * _listOfBaggage[i]['price'];
                  Map data = {
                    'title':
                        '${_addedBaggage[i]} X ${_listOfBaggage[i]['category']}',
                    'price': _addedBaggage[i] * _listOfBaggage[i]['price']
                  };
                  _selectedBaggage.add(data);
                }
              }

              Map data = {'items': _selectedBaggage, 'totalCost': totalCost};

              widget.onDone(data);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class InCrementDecrementButton extends StatelessWidget {
  final int value;
  final Function() onIncrement;
  final Function() onDecrement;

  const InCrementDecrementButton(
      {super.key,
      required this.value,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onDecrement,
              child: const SizedBox(
                height: 35,
                width: 35,
                child: Icon(
                  Icons.remove,
                  size: 18,
                ),
              ),
            ),
            Text(
              '$value',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: value < 2 ? onIncrement : null,
              child: const SizedBox(
                height: 35,
                width: 35,
                child: Icon(
                  Icons.add,
                  size: 18,
                ),
              ),
            ),
          ],
        ));
  }
}
