import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../models/flights_data_model.dart';
import '../../models/passenger_model.dart';
import 'add_passenger_sheet.dart';

class PassengerDetailsCard extends StatefulWidget {
  final Function(PassengerModel passenger) onAddPassenger;
  final List<TravelerPricing> travelerPricing;
  const PassengerDetailsCard(
      {super.key, required this.travelerPricing, required this.onAddPassenger});

  @override
  State<PassengerDetailsCard> createState() => _PassengerDetailsCardState();
}

class _PassengerDetailsCardState extends State<PassengerDetailsCard> {
  final List<PassengerModel> _adultPassengers = <PassengerModel>[];
  final List<PassengerModel> _childPassengers = <PassengerModel>[];
  final List<PassengerModel> _infantPassengers = <PassengerModel>[];

  int _allowedAdult = 0;

  int _allowedChild = 0;

  int _allowedInfant = 0;

  @override
  void initState() {
    for (var e in widget.travelerPricing) {
      if (e.travelerType == 'ADULT') {
        _allowedAdult = _allowedAdult + 1;
      }
      if (e.travelerType == 'CHILD') {
        _allowedChild = _allowedChild + 1;
      }
      if (e.travelerType == 'INFANT') {
        _allowedInfant = _allowedInfant + 1;
      }
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Adult
          PassengerTypeCard(
            allowedPassenger: _allowedAdult,
            currentPassenger: _adultPassengers.length,
            passengerType: 'Adult',
            onDone: (passenger) {
              _adultPassengers.add(passenger);
              widget.onAddPassenger(passenger);
              setState(() {});
            },
          ),
          ..._adultPassengers.map((e) => PassengerCard(
                passenger: e,
                onDelete: () {
                  _adultPassengers.remove(e);
                  setState(() {});
                },
              )),

          const Divider(),
          // Child
          _allowedChild == 0
              ? const SizedBox()
              : PassengerTypeCard(
                  allowedPassenger: _allowedChild,
                  currentPassenger: _childPassengers.length,
                  passengerType: 'Child',
                  onDone: (passenger) {
                    _childPassengers.add(passenger);
                    widget.onAddPassenger(passenger);
                    setState(() {});
                  },
                ),
          ..._childPassengers.map((e) => PassengerCard(
                passenger: e,
                onDelete: () {
                  _childPassengers.remove(e);
                  setState(() {});
                },
              )),
          _allowedChild == 0 ? const SizedBox() : const Divider(),

          // Infant
          _allowedInfant == 0
              ? const SizedBox()
              : PassengerTypeCard(
                  allowedPassenger: _allowedInfant,
                  currentPassenger: _infantPassengers.length,
                  passengerType: 'Infant',
                  onDone: (passenger) {
                    _infantPassengers.add(passenger);
                    widget.onAddPassenger(passenger);
                    setState(() {});
                  },
                ),
          ..._infantPassengers.map((e) => PassengerCard(
                passenger: e,
                onDelete: () {
                  _infantPassengers.remove(e);
                  setState(() {});
                },
              )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class PassengerTypeCard extends StatelessWidget {
  final int allowedPassenger;
  final int currentPassenger;
  final String passengerType;
  final Function(PassengerModel passenger) onDone;
  const PassengerTypeCard(
      {super.key,
      required this.onDone,
      required this.allowedPassenger,
      required this.currentPassenger,
      required this.passengerType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text('$passengerType ($currentPassenger/$allowedPassenger)',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          )),
      subtitle: Text(
          passengerType == 'Adult'
              ? 'Age 12 years or above'
              : passengerType == 'Child'
                  ? 'Between age 2 to 12 years'
                  : 'Between age 15 days to 2 years',
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          )),
      trailing: allowedPassenger > currentPassenger
          ? InkWell(
              onTap: () {
                showAddPassengerSheet(
                  context: context,
                  onDone: onDone,
                  travellerType: passengerType,
                );
              },
              child: const CircleAvatar(
                radius: 16,
                child: Icon(Icons.add, size: 18, color: AppColors.secondary),
              ),
            )
          : const SizedBox(),
    );
  }
}

class PassengerCard extends StatelessWidget {
  final PassengerModel passenger;
  final Function onDelete;
  const PassengerCard(
      {super.key, required this.passenger, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.grey.withOpacity(0.1),
        child: Text(
          '${passenger.firstName!.substring(0, 1)}${passenger.lastName!.substring(0, 1)}',
          style: const TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
      title: Text('${passenger.firstName} ${passenger.lastName}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )),
      subtitle: Text(
        '${passenger.gender} | ${AppHelpers.formatDate(passenger.dateOfBirth ?? DateTime.now())}',
        style: const TextStyle(
          fontSize: 12,
          color: AppColors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: InkWell(
        onTap: () => onDelete(),
        child: const Icon(
          Icons.remove_circle_outline_rounded,
          size: 18,
          color: AppColors.error,
        ),
      ),
    );
  }
}
