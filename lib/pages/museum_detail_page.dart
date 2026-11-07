import 'dart:async';
import 'dart:ui' show ImageFilter;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_integrador_poo_2026_2/models/museum.dart';
import 'package:url_launcher/url_launcher.dart';

class MuseumDetailPage extends StatelessWidget {
  const MuseumDetailPage({super.key, required this.museum});

  final Museum museum;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: _DetailPalette.canvas,
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.only(top: 80 + topInset),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
                      child: _MuseumDetail(museum: museum),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _DetailBar(topInset: topInset),
            ),
          ],
        ),
      ),
    );
  }
}

class _MuseumDetail extends StatelessWidget {
  const _MuseumDetail({required this.museum});

  final Museum museum;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          museum.name,
          style: _detailText(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            height: 1,
            letterSpacing: 48 * -0.03,
          ),
        ),
        const SizedBox(height: 28),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ColoredBox(
              color: _DetailPalette.imagePlate,
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
        const SizedBox(height: 28),
        Text(
          museum.description,
          style: _detailText(
            fontSize: 17,
            height: 1.6,
            letterSpacing: 17 * -0.01,
            color: _DetailPalette.textTertiary,
          ),
        ),
        const SizedBox(height: 28),
        const DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: _DetailPalette.footerLine)),
          ),
          child: SizedBox(height: 20),
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 17,
              color: _DetailPalette.textSecondary,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: SelectableText(
                museum.coordinates,
                style: _detailText(
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
              style: _detailText(
                fontSize: 13,
                height: 1.25,
                color: _DetailPalette.textSecondary,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: _DetailWebsiteLink(url: museum.website)),
          ],
        ),
      ],
    );
  }
}

class _DetailBar extends StatelessWidget {
  const _DetailBar({required this.topInset});

  final double topInset;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: _DetailPalette.nav,
            border: Border(bottom: BorderSide(color: _DetailPalette.navLine)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: topInset),
            child: SizedBox(
              height: 56,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        const _DetailBrand(),
                        const Spacer(),
                        _BackButton(
                          onPressed: () {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else {
                              Navigator.of(context).pushReplacementNamed('/');
                            }
                          },
                        ),
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

class _DetailBrand extends StatelessWidget {
  const _DetailBrand();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            color: _DetailPalette.navIconPlate,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: SizedBox(
            width: 32,
            height: 32,
            child: Icon(
              Icons.account_balance_outlined,
              size: 19,
              color: _DetailPalette.navIcon,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Sistema de Administración de Museos',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: _detailText(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.25,
            letterSpacing: 14 * -0.025,
            color: _DetailPalette.navTitle,
          ),
        ),
      ],
    );
  }
}

class _BackButton extends StatefulWidget {
  const _BackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<_BackButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: _StableTap(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered
                ? _DetailPalette.appleBlueHover
                : _DetailPalette.appleBlue,
            borderRadius: const BorderRadius.all(Radius.circular(999)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_back, size: 14, color: Colors.white),
              const SizedBox(width: 6),
              Text(
                'Museos',
                style: _detailText(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailWebsiteLink extends StatelessWidget {
  const _DetailWebsiteLink({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return _StableTap(
      onTap: () {
        unawaited(
          launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
            webOnlyWindowName: '_blank',
          ),
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                url,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: _detailText(
                  fontSize: 13,
                  height: 1.25,
                  color: _DetailPalette.appleBlue,
                ),
              ),
            ),
            const SizedBox(width: 2),
            const Icon(
              Icons.arrow_outward,
              size: 14,
              color: _DetailPalette.appleBlue,
            ),
          ],
        ),
      ),
    );
  }
}

class _StableTap extends StatefulWidget {
  const _StableTap({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  State<_StableTap> createState() => _StableTapState();
}

class _StableTapState extends State<_StableTap> {
  Offset? _down;

  void _finish(PointerEvent event) {
    final origin = _down;
    _down = null;
    if (origin == null) return;
    if ((event.position - origin).distance <= kTouchSlop) {
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (event) {
        if (event.buttons == kPrimaryButton) _down = event.position;
      },
      onPointerUp: _finish,
      onPointerCancel: (_) => _down = null,
      child: widget.child,
    );
  }
}

abstract final class _DetailPalette {
  static const canvas = Color(0xFFF5F5F7);
  static const textPrimary = Color(0xFF1D1D1F);
  static const textSecondary = Color(0xFF86868B);
  static const textTertiary = Color(0xFF6E6E73);
  static const appleBlue = Color(0xFF0071E3);
  static const appleBlueHover = Color(0xFF0077ED);
  static const nav = Color.fromRGBO(22, 22, 23, 0.85);
  static const navLine = Color.fromRGBO(255, 255, 255, 0.08);
  static const navTitle = Color(0xFFF5F5F7);
  static const navIcon = Color.fromRGBO(255, 255, 255, 0.9);
  static const navIconPlate = Color.fromRGBO(255, 255, 255, 0.1);
  static const imagePlate = Color(0xFFEEEDF3);
  static const footerLine = Color.fromRGBO(0, 0, 0, 0.05);
}

TextStyle _detailText({
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w400,
  Color color = _DetailPalette.textPrimary,
  double height = 1.5,
  double letterSpacing = 0,
}) {
  return TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
    leadingDistribution: TextLeadingDistribution.even,
  );
}
