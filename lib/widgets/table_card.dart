import 'package:flutter/material.dart';

class TableCard extends StatelessWidget {
  final String? prefix;
  final String? main;
  final String? suffix;
  final List<String> columns;
  final List<Map<String, dynamic>> data;
  final List<Widget> Function(Map<String, dynamic> item) rowBuilder;

  const TableCard({
    super.key,
    this.prefix,
    this.main,
    this.suffix,
    required this.columns,
    required this.data,
    required this.rowBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          if (prefix != null || main != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Row(
                children: [
                  if (prefix != null)
                    Text(
                      prefix!,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  SizedBox(width: 8),
                  if (main != null)
                    Expanded(
                      child: Text(
                        main!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Text(
                    suffix ?? "${data.length} Units",
                    style: TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                ],
              ),
            ),

          Table(
            columnWidths: {
              0: FixedColumnWidth(55),
              1: FixedColumnWidth(50),
              4: FlexColumnWidth(1.2),
            },
            defaultColumnWidth: FlexColumnWidth(1.0),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
              horizontalInside: BorderSide(color: Colors.white10, width: 0.5),
              verticalInside: BorderSide(color: Colors.white10, width: 0.5),
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  border: Border(
                    top: BorderSide(color: Colors.white10, width: 0.5),
                  ),
                ),
                children: columns
                    .map(
                      (col) => _cell(
                        Text(
                          col,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              ...data.map(
                (item) => TableRow(
                  children: rowBuilder(
                    item,
                  ).map((widget) => _cell(widget)).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cell(Widget child) => Padding(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
    child: Center(child: child),
  );
}
