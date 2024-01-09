// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fitness_widgetbook/widgetbook/main.dart' as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'FAAppBar',
        useCase: _i1.WidgetbookUseCase(
          name: 'AppBar',
          builder: _i2.appBar,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FAButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Welcome Screen Button',
          builder: _i2.primaryButton,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'FACard',
        useCase: _i1.WidgetbookUseCase(
          name: 'CardHome',
          builder: _i2.cardHome,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'Theme',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'Typography',
        useCase: _i1.WidgetbookUseCase(
          name: 'SurfaceThemeData',
          builder: _i2.colorAppThemeData,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Typography',
        useCase: _i1.WidgetbookUseCase(
          name: 'Text',
          builder: _i2.textHome,
        ),
      )
    ],
  ),
];
