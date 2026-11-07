import 'dart:async';
import 'dart:ui' show ImageFilter;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_integrador_poo_2026_2/models/museum.dart';
import 'package:proyecto_integrador_poo_2026_2/pages/museum_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

abstract final class _Palette {
  static const canvas = Color(0xFFF5F5F7);
  static const card = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF1D1D1F);
  static const textSecondary = Color(0xFF86868B);
  static const textTertiary = Color(0xFF6E6E73);
  static const appleBlue = Color(0xFF0071E3);
  static const appleBlueHover = Color(0xFF0077ED);
  static const hairline = Color.fromRGBO(0, 0, 0, 0.08);
  static const badge = Color(0xFFE8E8ED);
  static const nav = Color.fromRGBO(22, 22, 23, 0.85);
  static const navLine = Color.fromRGBO(255, 255, 255, 0.08);
  static const navTitle = Color(0xFFF5F5F7);
  static const navIcon = Color.fromRGBO(255, 255, 255, 0.9);
  static const navIconPlate = Color.fromRGBO(255, 255, 255, 0.1);
  static const imagePlate = Color(0xFFEEEDF3);
  static const footerLine = Color.fromRGBO(0, 0, 0, 0.05);
  static const shadow = Color.fromRGBO(0, 0, 0, 0.03);
  static const shadowHover = Color.fromRGBO(0, 0, 0, 0.08);
  static const fieldShadow = Color.fromRGBO(0, 0, 0, 0.05);
  static const fieldHoverBorder = Color.fromRGBO(0, 0, 0, 0.2);
  static const fieldIdle = Color.fromRGBO(255, 255, 255, 0.9);
  static const focusRing = Color.fromRGBO(0, 113, 227, 0.1);
}

TextStyle _inter({
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w400,
  Color color = _Palette.textPrimary,
  double height = 1.5,
  double letterSpacing = 0,
  TextDecoration decoration = TextDecoration.none,
  Color? decorationColor,
}) {
  return TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
    decoration: decoration,
    decorationColor: decorationColor,
    leadingDistribution: TextLeadingDistribution.even,
  );
}

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: _Palette.appleBlue,
          selectionColor: Color(0x330071E3),
          selectionHandleColor: _Palette.appleBlue,
        ),
      ),
      child: Scaffold(
        backgroundColor: _Palette.canvas,
        body: DefaultTextStyle(
          style: _inter(),
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          child: Stack(
            children: [
              Positioned.fill(child: _PageBody(topInset: topInset)),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _TopBar(topInset: topInset),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageBody extends StatelessWidget {
  const _PageBody({required this.topInset});

  final double topInset;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: 80 + topInset),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 48, 24, 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_TitleBlock(), SizedBox(height: 40), _MuseumCatalog()],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.topInset});

  final double topInset;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: _Palette.nav,
            border: Border(bottom: BorderSide(color: _Palette.navLine)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topInset),
            child: SizedBox(
              height: 56,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        _BrandMark(),
                        SizedBox(width: 12),
                        Expanded(child: _BrandText()),
                        SizedBox(width: 16),
                        _RegisterButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: _Palette.navIconPlate,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: SizedBox(
        width: 32,
        height: 32,
        child: Icon(
          Icons.account_balance_outlined,
          size: 19,
          color: _Palette.navIcon,
        ),
      ),
    );
  }
}

class _BrandText extends StatelessWidget {
  const _BrandText();

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 640;
    final title = Text(
      'Sistema de Administración de Museos',
      maxLines: wide ? 1 : 2,
      overflow: TextOverflow.ellipsis,
      style: _inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.25,
        letterSpacing: 14 * -0.025,
        color: _Palette.navTitle,
      ),
    );
    final subtitle = Text(
      'Organiza · Conserva · Comparte',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: _inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.27,
        color: _Palette.textSecondary,
      ),
    );

    if (!wide) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, subtitle],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Flexible(child: title),
        const SizedBox(width: 10),
        Flexible(child: subtitle),
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return _Hover(
      cursor: SystemMouseCursors.click,
      builder: (context, hovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: hovered ? _Palette.appleBlueHover : _Palette.appleBlue,
            borderRadius: const BorderRadius.all(Radius.circular(999)),
            boxShadow: const [
              BoxShadow(
                color: _Palette.fieldShadow,
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: Text(
            'Registrar museo',
            style: _inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

class _TitleBlock extends StatelessWidget {
  const _TitleBlock();

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 640;
    final titleSize = wide ? 48.0 : 36.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Museos',
                style: _inter(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w600,
                  height: wide ? 1 : 40 / 36,
                  letterSpacing: titleSize * -0.03,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const _CountBadge(),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Inventario de museos registrados en el sistema.',
          style: _inter(
            fontSize: 17,
            height: 1.5,
            letterSpacing: 17 * -0.01,
            color: _Palette.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge();

  @override
  Widget build(BuildContext context) {
    final count = museums.length;
    final label = count == 1 ? '1 museo' : '$count museos';

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: _Palette.badge,
        borderRadius: BorderRadius.all(Radius.circular(999)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Text(
          label,
          style: _inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            height: 1.25,
            letterSpacing: 13 * -0.025,
          ),
        ),
      ),
    );
  }
}

class _MuseumCatalog extends StatefulWidget {
  const _MuseumCatalog();

  @override
  State<_MuseumCatalog> createState() => _MuseumCatalogState();
}

class _MuseumCatalogState extends State<_MuseumCatalog> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _hovered = false;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() => setState(() {});

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  List<Museum> get _visible {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) {
      return museums;
    }
    return [
      for (final museum in museums)
        if (museum.name.toLowerCase().contains(query)) museum,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final focused = _focusNode.hasFocus;
    final borderColor = focused
        ? _Palette.appleBlue
        : _hovered
        ? _Palette.fieldHoverBorder
        : _Palette.hairline;
    final visible = _visible;
    final columns = MediaQuery.sizeOf(context).width >= 768 ? 2 : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 576),
            child: MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                height: 44,
                decoration: BoxDecoration(
                  color: focused ? _Palette.card : _Palette.fieldIdle,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: borderColor),
                  boxShadow: [
                    const BoxShadow(
                      color: _Palette.fieldShadow,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                    if (focused)
                      const BoxShadow(
                        color: _Palette.focusRing,
                        spreadRadius: 4,
                      ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onChanged: (value) => setState(() => _query = value),
                      cursorColor: _Palette.appleBlue,
                      cursorWidth: 1,
                      style: _inter(fontSize: 14, height: 1.25),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        isDense: true,
                        filled: false,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        hintText: 'Buscar por nombre',
                        hintStyle: _inter(
                          fontSize: 14,
                          height: 1.25,
                          color: _Palette.textSecondary,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(
                          44,
                          12,
                          16,
                          12,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 16,
                      top: 0,
                      bottom: 0,
                      child: IgnorePointer(
                        child: Center(
                          child: Icon(
                            Icons.search,
                            size: 20,
                            color: _Palette.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Semantics(
          label: 'Directorio de instituciones',
          container: true,
          child: visible.isEmpty
              ? const _EmptyResults()
              : _MuseumGrid(museums: visible, columns: columns),
        ),
      ],
    );
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: _Palette.card,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: _Palette.hairline),
      ),
      child: Column(
        children: [
          const Icon(Icons.search_off, size: 36, color: _Palette.textSecondary),
          const SizedBox(height: 8),
          Text(
            'No se encontraron museos',
            textAlign: TextAlign.center,
            style: _inter(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Ningún registro coincide con el criterio ingresado.',
            textAlign: TextAlign.center,
            style: _inter(fontSize: 14, color: _Palette.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _MuseumGrid extends StatelessWidget {
  const _MuseumGrid({required this.museums, required this.columns});

  final List<Museum> museums;
  final int columns;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var index = 0; index < museums.length; index += columns) {
      final cells = <Widget>[];
      for (var column = 0; column < columns; column++) {
        if (column > 0) {
          cells.add(const SizedBox(width: 24));
        }
        final itemIndex = index + column;
        cells.add(
          Expanded(
            child: itemIndex < museums.length
                ? _MuseumCard(
                    key: ValueKey(museums[itemIndex].name),
                    museum: museums[itemIndex],
                  )
                : const SizedBox.shrink(),
          ),
        );
      }
      final isLast = index + columns >= museums.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cells,
            ),
          ),
        ),
      );
    }

    return Column(children: rows);
  }
}

class _MuseumCard extends StatelessWidget {
  const _MuseumCard({super.key, required this.museum});

  final Museum museum;

  @override
  Widget build(BuildContext context) {
    return _Hover(
      cursor: SystemMouseCursors.click,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => MuseumDetailPage(museum: museum),
          ),
        );
      },
      builder: (context, hovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          clipBehavior: Clip.antiAlias,
          transform: Matrix4.translationValues(0, hovered ? -2 : 0, 0),
          decoration: BoxDecoration(
            color: _Palette.card,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(color: _Palette.hairline),
            boxShadow: [
              BoxShadow(
                color: hovered ? _Palette.shadowHover : _Palette.shadow,
                offset: hovered ? const Offset(0, 12) : const Offset(0, 2),
                blurRadius: hovered ? 32 : 8,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ColoredBox(
                      color: _Palette.imagePlate,
                      child: ClipRect(
                        child: AnimatedScale(
                          scale: hovered ? 1.05 : 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          filterQuality: FilterQuality.medium,
                          child: Image.asset(
                            museum.imageAsset,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.medium,
                            semanticLabel: museum.name,
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox.expand();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeOut,
                          style: _inter(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            letterSpacing: 21 * -0.02,
                            color: hovered
                                ? _Palette.appleBlue
                                : _Palette.textPrimary,
                          ),
                          child: Text(museum.name),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          museum.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: _inter(
                            fontSize: 15,
                            height: 1.625,
                            color: _Palette.textTertiary,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 28),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: _Palette.footerLine)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 17,
                              color: _Palette.textSecondary,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: SelectableText(
                                museum.coordinates,
                                style: _inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  height: 1.25,
                                  letterSpacing: 13 * -0.025,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Sitio web:',
                              style: _inter(
                                fontSize: 13,
                                height: 1.25,
                                color: _Palette.textSecondary,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(child: _WebsiteLink(url: museum.website)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WebsiteLink extends StatelessWidget {
  const _WebsiteLink({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return _Hover(
      cursor: SystemMouseCursors.click,
      onTap: () {
        unawaited(
          launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
            webOnlyWindowName: '_blank',
          ),
        );
      },
      builder: (context, hovered) {
        final color = hovered ? _Palette.appleBlueHover : _Palette.appleBlue;
        final style = _inter(
          fontSize: 13,
          height: 1.25,
          color: color,
          decoration: hovered ? TextDecoration.underline : TextDecoration.none,
          decorationColor: color,
        );
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                url,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style,
              ),
            ),
            const SizedBox(width: 2),
            Icon(Icons.arrow_outward, size: 14, color: color),
          ],
        );
      },
    );
  }
}

class _Hover extends StatefulWidget {
  const _Hover({
    required this.builder,
    this.cursor = MouseCursor.defer,
    this.onTap,
  });

  final Widget Function(BuildContext context, bool hovered) builder;
  final MouseCursor cursor;
  final VoidCallback? onTap;

  @override
  State<_Hover> createState() => _HoverState();
}

class _HoverState extends State<_Hover> {
  bool _hovered = false;
  Offset? _down;
  bool _claimedByChild = false;

  void _claim() => _claimedByChild = true;

  void _finish(PointerEvent event) {
    final origin = _down;
    final claimed = _claimedByChild;
    _down = null;
    _claimedByChild = false;
    if (origin == null || claimed || widget.onTap == null) return;
    if ((event.position - origin).distance <= kTouchSlop) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: (event) {
          if (event.buttons != kPrimaryButton) return;
          context.findAncestorStateOfType<_HoverState>()?._claim();
          _down = event.position;
        },
        onPointerUp: _finish,
        onPointerCancel: (_) {
          _down = null;
          _claimedByChild = false;
        },
        child: widget.builder(context, _hovered),
      ),
    );
  }
}
