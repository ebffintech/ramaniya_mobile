import 'package:flutter/material.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/booking_confirmation_screen.dart';
import 'package:ramaniya_mobile/widgets/screen_back_button.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({super.key});

  @override
  State<SchedulingScreen> createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  static const _screenBackground = Color(0xFFF7FBF8);

  static const _timeSlots = ['10:00', '11:30', '14:00', '16:30', '17:30'];

  static const _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const _weekdays = [
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY',
  ];

  late DateTime _displayMonth;
  int? _selectedDay;
  String? _selectedTime;

  @override
  void initState() {
    super.initState();
    _displayMonth = DateTime(2026, 6);
  }

  Set<int> get _availableDays {
    if (_displayMonth.year == 2026 && _displayMonth.month == 6) {
      return {
        4, 5, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 29, 30,
      };
    }
    return _weekdayDaysInMonth(_displayMonth);
  }

  Set<int> _weekdayDaysInMonth(DateTime month) {
    final lastDay = DateTime(month.year, month.month + 1, 0).day;
    final days = <int>{};
    for (var day = 1; day <= lastDay; day++) {
      final date = DateTime(month.year, month.month, day);
      if (date.weekday != DateTime.saturday && date.weekday != DateTime.sunday) {
        days.add(day);
      }
    }
    return days;
  }

  DateTime? get _selectedDate {
    if (_selectedDay == null) return null;
    return DateTime(_displayMonth.year, _displayMonth.month, _selectedDay!);
  }

  bool get _canConfirm => _selectedDay != null && _selectedTime != null;

  void _selectDay(int day) {
    if (!_availableDays.contains(day)) return;
    setState(() {
      _selectedDay = day;
      _selectedTime = null;
    });
  }

  void _selectTime(String time) {
    setState(() => _selectedTime = time);
  }

  void _previousMonth() {
    setState(() {
      _displayMonth = DateTime(_displayMonth.year, _displayMonth.month - 1);
      _selectedDay = null;
      _selectedTime = null;
    });
  }

  void _nextMonth() {
    setState(() {
      _displayMonth = DateTime(_displayMonth.year, _displayMonth.month + 1);
      _selectedDay = null;
      _selectedTime = null;
    });
  }

  String _monthYearLabel() =>
      '${_months[_displayMonth.month - 1]} ${_displayMonth.year}';

  String _selectedDayLabel() {
    final date = _selectedDate!;
    return '${_weekdays[date.weekday - 1]}, ${date.day} ${_months[date.month - 1].toUpperCase()}';
  }

  String _confirmLabel() {
    final date = _selectedDate!;
    final month = _months[date.month - 1].substring(0, 3);
    return 'Confirm ${date.day} $month \u00B7 $_selectedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _screenBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: ScreenBackButton(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightMintGreen,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.mintAccent),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified_user_outlined,
                          size: 14,
                          color: AppColors.primaryDarkGreen,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'STEP 2 \u00B7 PICK A SLOT',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                            color: AppColors.primaryDarkGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: _MeetingHeader(),
                      ),
                      const Divider(height: 1, color: AppColors.cardBorder),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _CalendarHeader(
                              monthLabel: _monthYearLabel(),
                              onPrevious: _previousMonth,
                              onNext: _nextMonth,
                            ),
                            const SizedBox(height: 16),
                            _CalendarGrid(
                              month: _displayMonth,
                              availableDays: _availableDays,
                              selectedDay: _selectedDay,
                              onDaySelected: _selectDay,
                            ),
                            if (_selectedDay != null) ...[
                              const SizedBox(height: 20),
                              const Divider(
                                height: 1,
                                color: AppColors.cardBorder,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                _selectedDayLabel(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8,
                                  color: AppColors.bodyGray,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _TimeSlotGrid(
                                slots: _timeSlots,
                                selectedTime: _selectedTime,
                                onTimeSelected: _selectTime,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _canConfirm
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) =>
                                  const BookingConfirmationScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _canConfirm
                        ? AppColors.primaryDarkGreen
                        : AppColors.primaryMediumGreen,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _canConfirm ? _confirmLabel() : 'Pick a date & time',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: Text(
                'Mock scheduler \u00B7 You\u2019ll get an email confirmation.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.bodyGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MeetingHeader extends StatelessWidget {
  const _MeetingHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.lightMintGreen,
                shape: BoxShape.circle,
              ),
              child: Text(
                'R',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryDarkGreen,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RAMANIYA ADVISORY',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                      color: AppColors.bodyGray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '30-min Investor Discovery Call',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      color: AppColors.headingDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Expanded(child: _MeetingTag(icon: Icons.schedule, label: '30 min')),
            SizedBox(width: 6),
            Expanded(
              child: _MeetingTag(
                icon: Icons.videocam_outlined,
                label: 'Google Meet',
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: _MeetingTag(icon: Icons.language, label: 'IST (Kolkata)'),
            ),
          ],
        ),
      ],
    );
  }
}

class _MeetingTag extends StatelessWidget {
  const _MeetingTag({required this.icon, required this.label});

  final IconData icon;
  final String label;

  static const _tagBackground = Color(0xFFEDF2F7);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: _tagBackground,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: AppColors.bodyGray),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: AppColors.headingDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({
    required this.monthLabel,
    required this.onPrevious,
    required this.onNext,
  });

  final String monthLabel;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          monthLabel,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.headingDark,
          ),
        ),
        const Spacer(),
        _MonthNavButton(icon: Icons.chevron_left, onTap: onPrevious),
        const SizedBox(width: 8),
        _MonthNavButton(icon: Icons.chevron_right, onTap: onNext),
      ],
    );
  }
}

class _MonthNavButton extends StatelessWidget {
  const _MonthNavButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.borderGray,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 32,
          height: 32,
          child: Icon(icon, size: 20, color: AppColors.headingDark),
        ),
      ),
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  const _CalendarGrid({
    required this.month,
    required this.availableDays,
    required this.selectedDay,
    required this.onDaySelected,
  });

  final DateTime month;
  final Set<int> availableDays;
  final int? selectedDay;
  final ValueChanged<int> onDaySelected;

  static const _weekdayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final startOffset = firstDay.weekday % 7;

    return Column(
      children: [
        Row(
          children: _weekdayLabels
              .map(
                (label) => Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.bodyGray.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 8),
        ...List.generate(((startOffset + daysInMonth + 6) / 7).ceil(), (week) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: List.generate(7, (weekday) {
                final cellIndex = week * 7 + weekday;
                final dayNumber = cellIndex - startOffset + 1;

                if (dayNumber < 1 || dayNumber > daysInMonth) {
                  return const Expanded(child: SizedBox(height: 36));
                }

                final isAvailable = availableDays.contains(dayNumber);
                final isSelected = selectedDay == dayNumber;

                return Expanded(
                  child: _CalendarDayCell(
                    day: dayNumber,
                    isAvailable: isAvailable,
                    isSelected: isSelected,
                    onTap: isAvailable ? () => onDaySelected(dayNumber) : null,
                  ),
                );
              }),
            ),
          );
        }),
      ],
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  const _CalendarDayCell({
    required this.day,
    required this.isAvailable,
    required this.isSelected,
    required this.onTap,
  });

  final int day;
  final bool isAvailable;
  final bool isSelected;
  final VoidCallback? onTap;

  static const _availableDateFill = Color(0xFFE8F5E9);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 36,
        child: Center(
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryDarkGreen
                  : isAvailable
                      ? _availableDateFill
                      : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$day',
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? AppColors.white
                    : isAvailable
                        ? AppColors.headingDark
                        : AppColors.bodyGray.withValues(alpha: 0.45),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeSlotGrid extends StatelessWidget {
  const _TimeSlotGrid({
    required this.slots,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final List<String> slots;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  static const _slotFill = Color(0xFFE8F5E9);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 8.0;
        const slotsPerRow = 4;
        final slotWidth =
            (constraints.maxWidth - spacing * (slotsPerRow - 1)) / slotsPerRow;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: slots.map((slot) {
            final isSelected = selectedTime == slot;
            return SizedBox(
              width: slotWidth,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onTimeSelected(slot),
                  borderRadius: BorderRadius.circular(10),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryDarkGreen
                          : _slotFill,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 10,
                    ),
                    child: Text(
                      slot,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? AppColors.white
                            : AppColors.headingDark,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
