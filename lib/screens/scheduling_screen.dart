import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/booking_confirmation_screen.dart';
import 'package:ramaniya_mobile/widgets/page_header.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({super.key});

  @override
  State<SchedulingScreen> createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  static const _timeSlots = ['10:00', '11:30', '14:00', '16:30', '17:30'];

  static const _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  static const _weekdays = [
    'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY',
    'FRIDAY', 'SATURDAY', 'SUNDAY',
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
      return {4, 5, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 29, 30};
    }
    return _weekdayDaysInMonth(_displayMonth);
  }

  Set<int> _weekdayDaysInMonth(DateTime month) {
    final lastDay = DateTime(month.year, month.month + 1, 0).day;
    return {
      for (var d = 1; d <= lastDay; d++)
        if (DateTime(month.year, month.month, d).weekday != DateTime.saturday &&
            DateTime(month.year, month.month, d).weekday != DateTime.sunday)
          d,
    };
  }

  DateTime? get _selectedDate =>
      _selectedDay == null ? null : DateTime(_displayMonth.year, _displayMonth.month, _selectedDay!);

  bool get _canConfirm => _selectedDay != null && _selectedTime != null;

  void _selectDay(int day) {
    if (!_availableDays.contains(day)) return;
    setState(() { _selectedDay = day; _selectedTime = null; });
  }

  void _selectTime(String time) => setState(() => _selectedTime = time);

  void _previousMonth() => setState(() {
    _displayMonth = DateTime(_displayMonth.year, _displayMonth.month - 1);
    _selectedDay = null; _selectedTime = null;
  });

  void _nextMonth() => setState(() {
    _displayMonth = DateTime(_displayMonth.year, _displayMonth.month + 1);
    _selectedDay = null; _selectedTime = null;
  });

  String get _monthYearLabel =>
      '${_months[_displayMonth.month - 1]} ${_displayMonth.year}';

  String get _selectedDayLabel {
    final d = _selectedDate!;
    return '${_weekdays[d.weekday - 1]}, ${d.day} ${_months[d.month - 1].toUpperCase()}';
  }

  String get _confirmLabel {
    final d = _selectedDate!;
    final m = _months[d.month - 1].substring(0, 3);
    return 'Confirm ${d.day} $m · $_selectedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softPageBg,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.pageGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                child: PageHeader(
                  kicker: 'STEP 2 · PICK A SLOT',
                  title: 'Schedule your call',
                  subtitle: '30-min discovery call via Google Meet, IST.',
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.creamWhite,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.borderMain),
                      boxShadow: AppColors.cardShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(18),
                          child: _MeetingHeader(),
                        ),
                        Divider(height: 1, color: AppColors.borderSoft),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CalendarHeader(
                                monthLabel: _monthYearLabel,
                                onPrevious: _previousMonth,
                                onNext: _nextMonth,
                              ),
                              const SizedBox(height: 14),
                              _CalendarGrid(
                                month: _displayMonth,
                                availableDays: _availableDays,
                                selectedDay: _selectedDay,
                                onDaySelected: _selectDay,
                              ),
                              if (_selectedDay != null) ...[
                                const SizedBox(height: 16),
                                Divider(height: 1, color: AppColors.borderSoft),
                                const SizedBox(height: 16),
                                Text(
                                  _selectedDayLabel,
                                  style: GoogleFonts.fraunces(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.8,
                                    color: AppColors.gold,
                                  ),
                                ),
                                const SizedBox(height: 10),
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
                child: GestureDetector(
                  onTap: _canConfirm
                      ? () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (_) => const BookingConfirmationScreen()),
                          )
                      : null,
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: _canConfirm ? AppColors.primaryButtonGradient : null,
                      color: _canConfirm ? null : AppColors.primaryForest.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _canConfirm ? _confirmLabel : 'Pick a date & time',
                          style: GoogleFonts.fraunces(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.creamWhite,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 16, color: AppColors.creamWhite),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  'Mock scheduler · You\'ll get an email confirmation.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.newsreader(
                    fontSize: 11,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Meeting header ────────────────────────────────────────────────────────────

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
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryForest,
                shape: BoxShape.circle,
              ),
              child: Text(
                'R',
                style: GoogleFonts.fraunces(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.creamWhite,
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
                    style: GoogleFonts.fraunces(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '30-min Investor Discovery Call',
                    style: GoogleFonts.fraunces(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryForest,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(child: _MeetingTag(icon: Icons.schedule, label: '30 min')),
            SizedBox(width: 6),
            Expanded(child: _MeetingTag(icon: Icons.videocam_outlined, label: 'Google Meet')),
            SizedBox(width: 6),
            Expanded(child: _MeetingTag(icon: Icons.language, label: 'IST (Kolkata)')),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.strongPaper,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.borderSoft),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: AppColors.muted),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Calendar ──────────────────────────────────────────────────────────────────

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
          style: GoogleFonts.fraunces(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryForest,
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
      color: AppColors.strongPaper,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.borderMain),
          ),
          child: Icon(icon, size: 18, color: AppColors.primaryForest),
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
              .map((l) => Expanded(
                    child: Text(
                      l,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppColors.muted,
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 6),
        ...List.generate(
          ((startOffset + daysInMonth + 6) / 7).ceil(),
          (week) => Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              children: List.generate(7, (weekday) {
                final idx = week * 7 + weekday;
                final day = idx - startOffset + 1;
                if (day < 1 || day > daysInMonth) {
                  return const Expanded(child: SizedBox(height: 34));
                }
                final isAvailable = availableDays.contains(day);
                final isSelected = selectedDay == day;
                return Expanded(
                  child: _CalendarDayCell(
                    day: day,
                    isAvailable: isAvailable,
                    isSelected: isSelected,
                    onTap: isAvailable ? () => onDaySelected(day) : null,
                  ),
                );
              }),
            ),
          ),
        ),
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 34,
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryForest
                  : isAvailable
                      ? AppColors.primaryForest.withValues(alpha: 0.08)
                      : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$day',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? AppColors.creamWhite
                    : isAvailable
                        ? AppColors.primaryForest
                        : AppColors.muted.withValues(alpha: 0.45),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Time slot grid ────────────────────────────────────────────────────────────

class _TimeSlotGrid extends StatelessWidget {
  const _TimeSlotGrid({
    required this.slots,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  final List<String> slots;
  final String? selectedTime;
  final ValueChanged<String> onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
                        ? AppColors.primaryForest
                        : AppColors.primaryForest.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryForest
                          : AppColors.borderMain,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 10),
                  child: Text(
                    slot,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.fraunces(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.creamWhite
                          : AppColors.primaryForest,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
