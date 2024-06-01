import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:unit_auto/common/widgets/custom_shapes/curved_edges/curved_edges_widget15.dart';

class UDetailAppBarSearch extends StatelessWidget {
  const UDetailAppBarSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 126.0,
      toolbarHeight: 0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: false, // остается видимой в начале прокрутки
      stretch: false, // растягивается при прокрутке
      flexibleSpace: UCurvedEdgesWidget15(
        child: Container(
          color: const Color.fromRGBO(130, 183, 159, 1),
          height: 206,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(child: const USearchContainer(text: 'Поиск производителя', showBorder: true, showBackground: false)),
          ),
        ),
      ),
    );
  }
}
