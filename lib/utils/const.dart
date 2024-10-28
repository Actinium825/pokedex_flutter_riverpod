import 'package:flutter/material.dart';

// Pokemon List Page
const pokemonListPageFooterHeight = 100.0;
const pokemonGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250, childAspectRatio: 3 / 2);
const pokemonListPagePadding = EdgeInsets.symmetric(horizontal: 12.0);
const pokemonCardPadding = EdgeInsets.all(8.0);
const pokemonNamePadding = EdgeInsets.symmetric(vertical: 8.0);
const pokemonCardSize = 80.0;
const pokemonTypeNamePadding = EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0);
const pokemonTypeNameMargin = EdgeInsets.only(bottom: 4.0, right: 8.0);
const progressIndicatorFooterPadding = EdgeInsets.all(12.0);
const debouncerDelayInMilliseconds = 300;

// Pokemon Info Page
const infoPageHeaderPadding = EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);
const idNumberPadWidth = 3;
const infoPageImageSize = 200.0;
const colorModifier = 0.1;
const typeNameRadius = 20.0;
const infoPageModalPadding = EdgeInsets.symmetric(horizontal: 4.0);
const infoPageModalRadius = BorderRadius.vertical(top: Radius.circular(20.0));
const aboutTabPadding = EdgeInsets.all(16.0);
const flavorTextPadding = EdgeInsets.only(top: 8.0, bottom: 16.0);
const tableLabelPadding = EdgeInsets.all(4.0);
const evolutionGridCount = 9;
const evolutionGridCrossAxisCount = 3;
const evolutionGridMainAxisSpacing = 40.0;
const evolutionTabMargin = EdgeInsets.symmetric(vertical: 32.0);
const evolutionCardImageSize = 50.0;
const eeveeArrowsDivisors = [1.25, 2, 4];
