import 'package:flutter/material.dart';
import 'package:kw_store/core/utils/media_query_values.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/widgets/small_text_widget.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;
  void changeExpandedState() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallTextWidget(
            widget.text,
            maxLines: isExpanded ? null : 3,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            size: AppDimensions.font20(context) / 1.1,
          ),
          SizedBox(height: AppDimensions.height10(context)),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                changeExpandedState();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isExpanded ? 'Show Less' : 'Show More',
                    style: TextStyle(
                      color: context.theme.textTheme.bodyMedium!.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: AppDimensions.width10(context)),
                  Icon(
                    isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    size: AppDimensions.height20(context),
                    color: context.theme.iconTheme.color,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
