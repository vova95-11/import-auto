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
      expandedHeight: 112.0,
      toolbarHeight: 0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: false, // остается видимой в начале прокрутки
      stretch: false, // растягивается при прокрутке
      flexibleSpace: UCurvedEdgesWidget15(
        child: Container(
          color: const Color.fromRGBO(130, 183, 159, 1),
          height: 220,
          child: Stack(
            children: [
              Positioned(top: 120, child: const USearchContainer(text: 'Поиск производителя', showBorder: true, showBackground: false)),
            ],
          ),
        ),
      ),
    );
  }
}
