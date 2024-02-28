// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ChartApp extends StatelessWidget {
//   const ChartApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  _MyHomePage();
    
//   }
// }

// class _MyHomePage extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   _MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<_MyHomePage> {
//   late List<_ChartData> data;
//   late TooltipBehavior _tooltip;

//   @override
//   void initState() {
//     data = [
//       _ChartData('David', 25),
//       _ChartData('Steve', 38),
//       _ChartData('Jack', 34),
//       _ChartData('Others', 52)
//     ];
//     _tooltip = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  SfCircularChart(
//         tooltipBehavior: _tooltip,
//         series: <CircularSeries<_ChartData, String>>[
//           DoughnutSeries<_ChartData, String>(
//               dataSource: data,
//               xValueMapper: (_ChartData data, _) => data.x,
//               yValueMapper: (_ChartData data, _) => data.y,
//               name: 'Gold')
//         ],
   
//     );
//   }
// }

// class _ChartData {
//   _ChartData(this.x, this.y);

//   final String x;
//   final double y;
// }
