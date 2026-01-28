import 'package:flutter/material.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';

class DateFilterWidget extends StatefulWidget {
  const DateFilterWidget(
      {super.key,
      this.onDateSelected,
      required this.selectedDate,
      this.endDate});
  final DateTime selectedDate;
  final DateTime? endDate;
  final Function(DateTime date)? onDateSelected;

  @override
  State<DateFilterWidget> createState() => _DateFilterWidgetState();
}

class _DateFilterWidgetState extends State<DateFilterWidget> {
  DateTime startDate = DateTime.now();
  final ScrollController scrollController = ScrollController();
  List<DateTime> dates = [];
  int limit = 365; //days
  bool _hasScrolledToInitial = false;
  final Map<int, GlobalKey> _itemKeys = {};

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < limit; i++) {
      dates.add(startDate.add(Duration(days: i)));
      _itemKeys[i] = GlobalKey();
    }
  }

  @override
  void didUpdateWidget(DateFilterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _scrollToSelectedDate();
    }
  }

  void _scrollToSelectedDate() {
    // Wait for the widget to be built and items to be rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add a small delay to ensure all items are rendered
      Future.delayed(const Duration(milliseconds: 50), () {
        if (!scrollController.hasClients) return;

        final selectedDateString = AppHelpers.formatDate(
          widget.selectedDate,
          pattern: 'yyyy-MM-dd',
        );

        // Find the index of the selected date
        int? selectedIndex;
        for (int i = 0; i < dates.length; i++) {
          final dateString = AppHelpers.formatDate(
            dates[i],
            pattern: 'yyyy-MM-dd',
          );
          if (dateString == selectedDateString) {
            selectedIndex = i;
            break;
          }
        }

        if (selectedIndex != null) {
          _scrollToIndex(selectedIndex);
        }
      });
    });
  }

  double? _cachedItemWidth;

  double _getItemWidth() {
    // Try to get actual item width from rendered items
    if (_cachedItemWidth != null) return _cachedItemWidth!;

    // Try to measure from first few rendered items
    for (int i = 0; i < 5 && i < dates.length; i++) {
      final key = _itemKeys[i];
      if (key?.currentContext != null) {
        final RenderBox? renderBox =
            key!.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          _cachedItemWidth = renderBox.size.width;
          return _cachedItemWidth!;
        }
      }
    }

    // Fallback: Calculate based on item structure
    // Container: padding horizontal 16*2 = 32, margin horizontal 5*2 = 10
    // Text content: approximately 45-55px for month (3 chars) + day (2 chars)
    // Using responsive calculation based on screen density
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    const double itemPadding = 32.0; // horizontal padding 16*2
    const double itemMargin = 10.0; // horizontal margin 5*2
    final double estimatedContentWidth = 50.0 * textScaleFactor;
    final double itemWidth = itemPadding + itemMargin + estimatedContentWidth;

    _cachedItemWidth = itemWidth;
    return itemWidth;
  }

  void _scrollToIndex(int index) {
    if (!scrollController.hasClients) return;

    // Try to use RenderBox for precise positioning if item is rendered
    final key = _itemKeys[index];
    if (key?.currentContext != null) {
      final RenderBox? renderBox =
          key!.currentContext!.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        // Get the position relative to the ListView
        final position = renderBox.localToGlobal(Offset.zero);

        // Get the ListView's RenderBox to calculate relative position
        final listViewContext =
            scrollController.position.context.storageContext;
        final RenderBox? listViewBox =
            listViewContext.findRenderObject() as RenderBox?;
        if (listViewBox != null) {
          final listViewPosition = listViewBox.localToGlobal(Offset.zero);
          final relativeX = position.dx - listViewPosition.dx;

          // Position the selected item at the left edge (starting point) of the screen
          final double currentScroll = scrollController.position.pixels;
          final double targetScroll = currentScroll + relativeX;

          // Clamp the position to valid scroll range
          final double maxScroll = scrollController.position.maxScrollExtent;
          final double clampedPosition = targetScroll.clamp(0.0, maxScroll);

          scrollController.animateTo(
            clampedPosition,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          return;
        }
      }
    }

    // Fallback: Calculate based on item width
    final double itemWidth = _getItemWidth();
    // Position the selected item at the left edge (starting point) of the screen
    final double targetPosition = index * itemWidth;

    // Clamp the position to valid scroll range
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double clampedPosition = targetPosition.clamp(0.0, maxScroll);

    scrollController.animateTo(
      clampedPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scroll to selected date after first build
    if (!_hasScrolledToInitial) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSelectedDate();
        _hasScrolledToInitial = true;
      });
    }

    final String selectedDate = AppHelpers.formatDate(
      widget.selectedDate,
      pattern: 'yyyy-MM-dd',
    );
    final String endDate = widget.endDate != null
        ? AppHelpers.formatDate(widget.endDate!, pattern: 'yyyy-MM-dd')
        : '';
    return SizedBox(
      height: 70,
      width: AppHelpers.percentWidth(context: context),
      child: ListView.builder(
          controller: scrollController,
          itemCount: dates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final String thisDate =
                AppHelpers.formatDate(dates[index], pattern: 'yyyy-MM-dd');
            return InkWell(
              key: _itemKeys[index],
              onTap: () {
                widget.onDateSelected!(dates[index]);
                // log('${dates[index]}');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: selectedDate == thisDate || endDate == thisDate
                      ? AppHelpers.isDarkMode(context)
                          ? AppColors.primaryDark
                          : AppColors.black
                      : AppHelpers.isDarkMode(context)
                          ? AppColors.secondaryDark
                          : AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                height: 65,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppHelpers.formatDate(
                        dates[index],
                        pattern: 'MMM',
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selectedDate == thisDate || endDate == thisDate
                            ? AppColors.white
                            : AppColors.grey,
                      ),
                    ),
                    Text(
                      AppHelpers.formatDate(
                        dates[index],
                        pattern: 'dd',
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: selectedDate == thisDate || endDate == thisDate
                            ? AppColors.white
                            : AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
