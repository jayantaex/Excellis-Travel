import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/utils/app_toast.dart';
// import '../../../data/models/flights_data_model.dart';
import '../../../data/models/flight_offer_price_model.dart';
import '../../../data/models/passenger_model.dart';
import 'add_passenger_sheet.dart';

class PassengerDetailsCard extends StatefulWidget {
  const PassengerDetailsCard(
      {super.key,
      required this.travelerPricing,
      required this.onAddPassenger,
      required this.onPassengerRemove});
  final Function(PassengerModel passenger) onAddPassenger;
  final Function(PassengerModel passenger) onPassengerRemove;
  final List<TravelerPricing> travelerPricing;

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
    for (TravelerPricing e in widget.travelerPricing) {
      if (e.travelerType == 'ADULT') {
        _allowedAdult = _allowedAdult + 1;
      }
      if (e.travelerType == 'CHILD') {
        _allowedChild = _allowedChild + 1;
      }
      if (e.travelerType == 'HELD_INFANT') {
        _allowedInfant = _allowedInfant + 1;
      }
    }
    setState(() {});
    super.initState();
  }

  void _addPassenger(PassengerModel passenger) {
    // Generate unique ID if not exists
    passenger.id ??= DateTime.now().millisecondsSinceEpoch.toString();

    widget.onAddPassenger(passenger);
    if (passenger.type == 'ADULT') {
      _adultPassengers.add(passenger);
    } else if (passenger.type == 'CHILD') {
      _childPassengers.add(passenger);
    } else if (passenger.type == 'HELD_INFANT') {
      _infantPassengers.add(passenger);
    }
    setState(() {});
  }

  void _removePassenger(PassengerModel passenger) {
    widget.onPassengerRemove(passenger);
    if (passenger.type == 'ADULT') {
      _adultPassengers.removeWhere((p) => p.id == passenger.id);
    } else if (passenger.type == 'CHILD') {
      _childPassengers.removeWhere((p) => p.id == passenger.id);
    } else if (passenger.type == 'HELD_INFANT') {
      _infantPassengers.removeWhere((p) => p.id == passenger.id);
    }
    setState(() {});
  }

  void _updatePassenger(
      PassengerModel oldPassenger, PassengerModel newPassenger) {
    // Keep the same ID
    newPassenger.id = oldPassenger.id;

    if (oldPassenger.type == 'ADULT') {
      final index = _adultPassengers.indexWhere((p) => p.id == oldPassenger.id);
      if (index != -1) {
        _adultPassengers[index] = newPassenger;
        widget.onPassengerRemove(oldPassenger);
        widget.onAddPassenger(newPassenger);
      }
    } else if (oldPassenger.type == 'CHILD') {
      final index = _childPassengers.indexWhere((p) => p.id == oldPassenger.id);
      if (index != -1) {
        _childPassengers[index] = newPassenger;
        widget.onPassengerRemove(oldPassenger);
        widget.onAddPassenger(newPassenger);
      }
    } else if (oldPassenger.type == 'HELD_INFANT') {
      final index =
          _infantPassengers.indexWhere((p) => p.id == oldPassenger.id);
      if (index != -1) {
        _infantPassengers[index] = newPassenger;
        widget.onPassengerRemove(oldPassenger);
        widget.onAddPassenger(newPassenger);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            // Adult
            PassengerTypeCard(
              totalTravellers: widget.travelerPricing.length,
              allowedPassenger: _allowedAdult,
              currentPassenger: _adultPassengers.length,
              passengerType: 'ADULT',
              onAddPassenger: _addPassenger,
              onPassengerRemove: _removePassenger,
              travelerPricing: widget.travelerPricing,
              allowedAdult: _allowedAdult,
              allowedChild: _allowedChild,
              allowedInfant: _allowedInfant,
            ),
            ..._adultPassengers.map(
              (PassengerModel e) => PassengerCard(
                onPassengerRemove: _removePassenger,
                onPassengerUpdate: _updatePassenger,
                passenger: e,
              ),
            ),
            if (_allowedChild > 0 || _allowedInfant > 0) const Divider(),
            // Child
            _allowedChild == 0
                ? const SizedBox()
                : PassengerTypeCard(
                    totalTravellers: widget.travelerPricing.length,
                    allowedPassenger: _allowedChild,
                    currentPassenger: _childPassengers.length,
                    passengerType: 'CHILD',
                    onAddPassenger: _addPassenger,
                    onPassengerRemove: _removePassenger,
                    travelerPricing: widget.travelerPricing,
                    allowedAdult: _allowedAdult,
                    allowedChild: _allowedChild,
                    allowedInfant: _allowedInfant,
                  ),
            ..._childPassengers.map((PassengerModel e) => PassengerCard(
                  onPassengerRemove: _removePassenger,
                  onPassengerUpdate: _updatePassenger,
                  passenger: e,
                )),
            _allowedChild == 0 ? const SizedBox() : const Divider(),

            // Infant
            _allowedInfant == 0
                ? const SizedBox()
                : PassengerTypeCard(
                    totalTravellers: widget.travelerPricing.length,
                    allowedPassenger: _allowedInfant,
                    currentPassenger: _infantPassengers.length,
                    passengerType: 'HELD_INFANT',
                    onAddPassenger: _addPassenger,
                    onPassengerRemove: _removePassenger,
                    travelerPricing: widget.travelerPricing,
                    allowedAdult: _allowedAdult,
                    allowedChild: _allowedChild,
                    allowedInfant: _allowedInfant,
                  ),
            ..._infantPassengers.map((PassengerModel e) => PassengerCard(
                  passenger: e,
                  onPassengerRemove: _removePassenger,
                  onPassengerUpdate: _updatePassenger,
                )),
            const SizedBox(height: 10),
          ],
        ),
      );
}

class PassengerTypeCard extends StatelessWidget {
  const PassengerTypeCard({
    super.key,
    required this.allowedPassenger,
    required this.currentPassenger,
    required this.passengerType,
    required this.onAddPassenger,
    required this.travelerPricing,
    required this.onPassengerRemove,
    required this.totalTravellers,
    required this.allowedAdult,
    required this.allowedChild,
    required this.allowedInfant,
  });
  final int allowedPassenger;
  final int totalTravellers;
  final int allowedAdult;
  final int allowedChild;
  final int allowedInfant;
  final int currentPassenger;
  final String passengerType;
  final List<TravelerPricing>? travelerPricing;
  final Function(PassengerModel passenger) onAddPassenger;
  final Function(PassengerModel passenger) onPassengerRemove;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: allowedPassenger > currentPassenger
            ? () async {
                int travellerId = 1;
                List<FareDetailsBySegment> filterSegments =
                    <FareDetailsBySegment>[];

                switch (passengerType) {
                  case 'ADULT':
                    {
                      travellerId = currentPassenger + 1;
                    }
                    break;
                  case 'CHILD':
                    {
                      travellerId = allowedAdult + currentPassenger + 1;
                    }
                    break;
                  case 'HELD_INFANT':
                    {
                      travellerId =
                          allowedAdult + allowedChild + currentPassenger + 1;
                    }
                    break;
                  default:
                }

                if (travelerPricing != null) {
                  final List<TravelerPricing> filteredTravelerPricing =
                      travelerPricing!
                          .where((element) =>
                              element.travelerId!.toString() ==
                              travellerId.toString())
                          .toList();

                  filterSegments =
                      filteredTravelerPricing.first.fareDetailsBySegment!;
                }

                await showAddAndEditPassengerSheet(
                    context: context,
                    onDone: onAddPassenger,
                    travellerType: passengerType,
                    filteredSegemnts: filterSegments);
              }
            : null,
        contentPadding: const EdgeInsets.all(0),
        title: Text('$passengerType ($currentPassenger/$allowedPassenger)',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            )),
        subtitle: Text(
            passengerType == 'ADULT'
                ? 'Age 12 years or above'
                : passengerType == 'CHILD'
                    ? 'Between age 2 to 12 years'
                    : 'Between age 1 days to 2 years',
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
            )),
        trailing: allowedPassenger > currentPassenger
            ? const CircleAvatar(
                radius: 16,
                child: Icon(Icons.add, size: 18, color: AppColors.secondary),
              )
            : const SizedBox(),
      );
}

class PassengerCard extends StatelessWidget {
  const PassengerCard(
      {super.key,
      required this.passenger,
      required this.onPassengerUpdate,
      required this.onPassengerRemove});
  final PassengerModel passenger;
  final Function(PassengerModel oldPassenger, PassengerModel newPassenger)
      onPassengerUpdate;
  final Function(PassengerModel passenger) onPassengerRemove;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () async {
          await showAddAndEditPassengerSheet(
            context: context,
            onDone: (PassengerModel newPassenger) {
              onPassengerUpdate(passenger, newPassenger);
            },
            travellerType: passenger.type ?? 'ADULT',
            passenger: passenger,
          );
        },
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
          'Gender: ${passenger.gender} | DOB: ${passenger.dateOfBirth != null ? AppHelpers.formatDate(passenger.dateOfBirth ?? DateTime.now()) : 'N/A'}',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: InkWell(
          onTap: () {
            onPassengerRemove(passenger);
            showToast(
                message:
                    '${passenger.firstName} ${passenger.lastName} removed');
          },
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.error.withOpacity(0.1),
            child: const Icon(
              Icons.delete,
              size: 14,
              color: AppColors.error,
            ),
          ),
        ),
      );
}
