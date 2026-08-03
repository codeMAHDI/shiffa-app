import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../view_models/practitioner_dashboard_controller.dart';

class EarningOverviewScreen extends StatelessWidget {
  const EarningOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            // Since this is a tab, act like back goes to Home tab
            Get.find<PractitionerDashboardController>().changeIndex(0);
          },
        ),
        title: Text(
          'Earning Overview',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Earnings Card
            _buildStatCard(
              title: 'Total Earnings',
              value: '85,5000',
              subtitle: 'This month',
            ),
            SizedBox(height: 16.h),
            
            // Total Bookings Card
            _buildStatCard(
              title: 'Total Bookings',
              value: '80',
              subtitle: 'This month',
            ),
            SizedBox(height: 32.h),

            // Earnings Trend Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Earnings Trend',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B6A4C), // Dark green
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'This Week',
                        style: TextStyle(color: AppColors.white, fontSize: 12.sp),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.white, size: 16.w),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            
            // Earnings Bar Chart Mockup
            SizedBox(
              height: 160.h,
              child: _buildBarChart(),
            ),
            SizedBox(height: 40.h),

            // Bookings Trend Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bookings Trend',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B6A4C),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'This Week',
                        style: TextStyle(color: AppColors.white, fontSize: 12.sp),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.keyboard_arrow_down, color: AppColors.white, size: 16.w),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            
            // Bookings Line Chart Mockup
            SizedBox(
              height: 160.h,
              child: CustomPaint(
                painter: _LineChartPainter(),
                child: Container(),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value, required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B6A4C), // Dark green
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.white.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.arrow_drop_down, color: AppColors.black, size: 16.w),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    final List<double> heights = [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.65];
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Stack(
      children: [
        // Horizontal lines
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildChartGridLine('30k'),
            _buildChartGridLine('20k'),
            _buildChartGridLine('10k'),
            _buildChartGridLine('0   '),
          ],
        ),
        // Bars
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.only(left: 40.w, bottom: 20.h, top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(7, (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 16.w,
                      height: 120.h * heights[index],
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B6A4C),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      days[index],
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChartGridLine(String label) {
    return Row(
      children: [
        SizedBox(
          width: 30.w,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}

class _LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    final linePaint = Paint()
      ..color = const Color(0xFF1B6A4C)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final dotPaint = Paint()
      ..color = const Color(0xFF1B6A4C)
      ..style = PaintingStyle.fill;

    final textStyle = TextStyle(
      fontSize: 10.sp,
      color: const Color(0xFF1B6A4C), // Green text to match design
    );

    // Draw horizontal grid lines
    final double stepY = size.height / 3;
    final List<String> labels = ['30', '20', '10'];
    
    for (int i = 0; i < 3; i++) {
      double y = stepY * i;
      canvas.drawLine(Offset(30.w, y), Offset(size.width, y), gridPaint);
      
      final textSpan = TextSpan(text: labels[i], style: textStyle);
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      textPainter.layout();
      textPainter.paint(canvas, Offset(0, y - textPainter.height / 2));
    }
    // Bottom line
    canvas.drawLine(Offset(30.w, size.height), Offset(size.width, size.height), gridPaint);

    // Draw Line Chart
    final List<double> values = [0.1, 0.25, 0.4, 0.6, 0.75, 0.9, 0.7]; // Normalized heights
    final double stepX = (size.width - 40.w) / 6;
    
    final path = Path();
    final List<Offset> points = [];

    for (int i = 0; i < 7; i++) {
      double x = 40.w + (stepX * i);
      double y = size.height - (size.height * values[i]);
      points.add(Offset(x, y));
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, linePaint);

    // Draw dots
    for (var point in points) {
      canvas.drawCircle(point, 4, dotPaint);
    }

    // Draw X labels
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    for (int i = 0; i < 7; i++) {
      final textSpan = TextSpan(text: days[i], style: textStyle);
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      textPainter.layout();
      textPainter.paint(canvas, Offset(40.w + (stepX * i) - textPainter.width / 2, size.height + 10.h));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
