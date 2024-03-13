// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fitness_widgetbook/main.dart' as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'Theme',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'SurfaceThemeData',
        useCase: _i1.WidgetbookUseCase(
          name: 'SurfaceThemeData',
          builder: _i2.colorAppThemeData,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TypographyThemeData',
        useCase: _i1.WidgetbookUseCase(
          name: 'Text',
          builder: _i2.textHome,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'Components',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AppBar',
        useCase: _i1.WidgetbookUseCase(
          name: 'App Bar',
          builder: _i2.appBar,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Card',
        useCase: _i1.WidgetbookUseCase(
          name: 'CardHome',
          builder: _i2.cardHome,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Button',
        useCase: _i1.WidgetbookUseCase(
          name: 'Welcome Screen Button',
          builder: _i2.primaryButton,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Input',
        useCase: _i1.WidgetbookUseCase(
          name: 'Input',
          builder: _i2.input,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'BottomNavigationBar',
        useCase: _i1.WidgetbookUseCase(
          name: 'Bottom Navigation Bar',
          builder: _i2.bottomNavigationBar,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Carousel',
        useCase: _i1.WidgetbookUseCase(
          name: 'Carousel',
          builder: _i2.carousel,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'LoadingIndicator',
        useCase: _i1.WidgetbookUseCase(
          name: 'Loading Indicator',
          builder: _i2.loadingIndicator,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'SearchBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'Search Box',
          builder: _i2.searchBox,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'BodyMeasurementInput',
        useCase: _i1.WidgetbookUseCase(
          name: 'Body Measurement Input',
          builder: _i2.inputBodyMeasurements,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'SnackBar',
        useCases: [
          /*_i1.WidgetbookUseCase(
            name: 'Snack Bar Error',
            //builder: _i2.snackBarSuccess(),
          ),
          _i1.WidgetbookUseCase(
            name: 'Snack Bar Success',
            builder: _i2.snackBarSuccess,
          ),*/
        ],
      ),
    ],
  ),
];
