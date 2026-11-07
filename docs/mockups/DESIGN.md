---
name: Museo Minimalist Core
colors:
  surface: '#faf8fe'
  surface-dim: '#dad9df'
  surface-bright: '#faf8fe'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f4f3f8'
  surface-container: '#eeedf3'
  surface-container-high: '#e9e7ed'
  surface-container-highest: '#e3e2e7'
  on-surface: '#1a1b1f'
  on-surface-variant: '#414753'
  inverse-surface: '#2f3034'
  inverse-on-surface: '#f1f0f5'
  outline: '#717785'
  outline-variant: '#c1c6d6'
  surface-tint: '#005cbb'
  primary: '#0059b5'
  on-primary: '#ffffff'
  primary-container: '#0071e3'
  on-primary-container: '#fcfbff'
  inverse-primary: '#abc7ff'
  secondary: '#5f5e60'
  on-secondary: '#ffffff'
  secondary-container: '#e2dfe1'
  on-secondary-container: '#636264'
  tertiary: '#9b3f00'
  on-tertiary: '#ffffff'
  tertiary-container: '#c25100'
  on-tertiary-container: '#fffaf9'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d7e2ff'
  primary-fixed-dim: '#abc7ff'
  on-primary-fixed: '#001b3f'
  on-primary-fixed-variant: '#00458f'
  secondary-fixed: '#e4e2e4'
  secondary-fixed-dim: '#c8c6c8'
  on-secondary-fixed: '#1b1b1d'
  on-secondary-fixed-variant: '#474649'
  tertiary-fixed: '#ffdbcb'
  tertiary-fixed-dim: '#ffb693'
  on-tertiary-fixed: '#341000'
  on-tertiary-fixed-variant: '#7a3000'
  background: '#faf8fe'
  on-background: '#1a1b1f'
  surface-variant: '#e3e2e7'
  canvas-background: '#f5f5f7'
  surface-card: '#ffffff'
  border-hairline: '#e5e5ea'
  border-translucent: rgba(0, 0, 0, 0.07)
  nav-obsidian: rgba(29, 29, 31, 0.82)
  nav-frosted: rgba(255, 255, 255, 0.8)
  text-primary: '#1d1d1f'
  text-secondary: '#86868b'
  status-active: '#34c759'
  status-alert: '#ff3b30'
  status-curation: '#af52de'
typography:
  display-hero:
    fontFamily: Inter
    fontSize: 56px
    fontWeight: '600'
    lineHeight: 60px
    letterSpacing: -0.03em
  display-hero-mobile:
    fontFamily: Inter
    fontSize: 36px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.025em
  headline-lg:
    fontFamily: Inter
    fontSize: 40px
    fontWeight: '600'
    lineHeight: 44px
    letterSpacing: -0.025em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 34px
    letterSpacing: -0.02em
  headline-sm:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 26px
    letterSpacing: -0.015em
  title-md:
    fontFamily: Inter
    fontSize: 17px
    fontWeight: '600'
    lineHeight: 22px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 17px
    fontWeight: '400'
    lineHeight: 25px
    letterSpacing: -0.005em
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0em
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: -0.005em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
    letterSpacing: 0.03em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1.5rem
  gutter-mobile: 1rem
  margin: 2rem
  margin-mobile: 1rem
  margin-desktop: 3rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2.5rem
---

## Brand & Style

This design system embodies high-end institutional authority paired with Apple-grade modernism. Crafted specifically for museum administration, curatorial archives, and cultural exhibition management, the aesthetic privileges spatial elegance, absolute clarity, and serene confidence.

### Visual Philosophy & Influences
- **Refined Apple Minimalism:** Generous structural breathing room, hyper-disciplined typographic hierarchies, and pristine color restraint allow high-resolution cultural artifacts, historic documentation, and curatorial data to remain the focal point.
- **Precision Glassmorphism & Tonal Restraint:** Surface depth is communicated via subtle optical blurs, hairline boundaries, and layered luminosity rather than heavy drop shadows.
- **Institutional Clarity:** Interaction patterns evoke silent utility—calm, frictionless, and distraction-free. Interfaces prioritize high contrast without visual harshness, celebrating tactile simplicity and curated quietude.

## Colors

The palette is tuned around Apple's signature monochromatic foundation and focal interactive cobalt:

- **Canvas & Surface Layering:** The primary environmental backdrop uses `#F5F5F7`, creating an organic, gallery-wall separation against primary surfaces. Cards and modal containers sit on pure `#FFFFFF`.
- **Typographic Tones:** Pure `#1D1D1F` serves as primary ink for deep contrast, while `#86868B` supplies supporting hierarchy for metadata, captions, and structural breadcrumbs.
- **Interactive Blue (`#0071E3`):** Reserved strictly for actionable highlights, focused controls, active navigation markers, and clear primary CTA flows.
- **Borders & Dividers:** Never employ harsh geometric lines. Use hairline separation via `#E5E5EA` or an optical tint of `rgba(0, 0, 0, 0.07)`.

## Typography

The typographic hierarchy implements Inter with precision optical tracking matching the tone of Apple’s SF Pro display and text typefaces:

- **Negative Tracking on Display Elements:** Headlines apply tightened tracking (`-0.015em` to `-0.03em`) to deliver modern, monolithic architectural balance.
- **Editorial Legibility:** Body texts maintain comfortable vertical cadence with line-height ratios above 1.45×, preserving readability across complex archival databases and inventory sheets.
- **Metadata and Badges:** Micro-labels utilize semi-bold and medium treatments with slightly opened tracking (`+0.01em` to `+0.03em`) to retain legibility even at 11px rendering.

## Layout & Spacing

Layouts follow a fluid 12-column grid system calibrated around an expansive max container width of 1440px:

- **Structural Rhythm:** Section transitions use multiples of `space-xl` (40px) to establish confident separation between content blocks.
- **Desktop Behavior:** A 12-column setup with `24px` gutters (`gutter`) and minimum `32px` to `48px` page margins (`margin-desktop`), providing an open-air curatorial view.
- **Tablet Reflow:** 8-column layout with `20px` gutters and `24px` margins. Sidebars collapse to slide-over translucent inspectors.
- **Mobile Handheld:** 4 columns with `16px` margins and gutters. Cards flatten slightly into single-stack feeds while keeping clean edge padding.

## Elevation & Depth

Spatial separation avoids dense, opaque drops. Depth is generated through calibrated diffusion and Apple-style material translucent blurs:

- **Backdrop Frosting (Level 0 - Navigation & Bars):** `backdrop-filter: blur(20px) saturate(180%)` applied over `rgba(255, 255, 255, 0.8)` or dark obsidian `rgba(29, 29, 31, 0.82)`, framed by a crisp `1px` translucent bottom divider (`rgba(0, 0, 0, 0.08)` or `rgba(255, 255, 255, 0.12)`).
- **Surface Elevation (Cards & Artifact Panels):** Primary modules leverage flat pure-white containers anchored by a hairline contour: `border: 1px solid rgba(0, 0, 0, 0.06)` combined with an ambient diffuse shadow: `box-shadow: 0 4px 24px -2px rgba(0, 0, 0, 0.04), 0 2px 6px -1px rgba(0, 0, 0, 0.02)`.
- **Floating Modals & Inspectors:** Higher hierarchy panels feature: `box-shadow: 0 20px 48px -10px rgba(0, 0, 0, 0.12), 0 1px 3px rgba(0, 0, 0, 0.04)`.

## Shapes

The geometric form language leverages smooth continuous corner curves mimicking Apple squircle aesthetics:

- **Standard Cards and Modules:** Scaled at `rounded-2xl` (16px to 18px radius) for tactile balance without feeling overly cartoonish.
- **Interactive Badges and Action Chips:** Rendered as full pills (`border-radius: 9999px`) to distinguish actionable tags, status indicators, and curatorial categories.
- **Inner Nested Elements:** Secondary form elements within cards (such as inputs and sub-panels) use `rounded-lg` (8px to 10px) to preserve harmonic optical concentricity with parent card boundaries.

## Components

### Buttons & Interactive Controls
- **Primary CTA:** Solid `#0071E3` fill with white text, `border-radius: 9999px` (pill) or `12px`, padding of `10px 20px`. Subtle scale transform on press (`transform: scale(0.98)`).
- **Secondary Action:** Pill-shaped translucent soft gray (`background: rgba(0, 0, 0, 0.04)`), dark text `#1D1D1F`, transition to `rgba(0, 0, 0, 0.08)` on hover.
- **Ghost/Curatorial Link:** Text-only `#0071E3` with an inline chevron (`›`), zero padding, underline reserved strictly for hover states.

### Search & Global Command Bar
- **Pill Backdrop Filter:** Centered or anchored header search input encased in a frosted pill (`backdrop-filter: blur(16px); background: rgba(235, 235, 240, 0.65)`).
- **Focus Transition:** Focus widens the search container gently while shifting background to `#FFFFFF` with an ambient glow and hairline border `#0071E3`.

### Cards & Artifact Display Tiles
- **Curatorial Canvas:** Pure white surface (`#FFFFFF`), `16px` border-radius, hairline stroke `rgba(0, 0, 0, 0.06)`.
- **Artwork Frame:** Media headers within cards are framed edge-to-edge with matching top curvature, using subtle inner borders to separate light artwork from white card canvas.

### Chips & Status Badges
- **Pill Metadata:** Full capsule shape (`rounded-full`), `4px 10px` vertical-horizontal padding, font size `12px` font weight `500`.
- **States:** Light pastel tinted backdrops (e.g., Active restoration in soft green `rgba(52, 199, 89, 0.12)` with `#248A3D` text; Exhibition in queue in soft cobalt `rgba(0, 113, 227, 0.1)` with `#0071E3` text).

### Form Controls (Inputs, Checkboxes & Radios)
- **Text Fields:** Subtle inset look using `#F5F5F7` background, `10px` radius, hairline border, transitioning to crisp white surface and `#0071E3` ring highlight on focus.
- **Checkboxes & Radios:** Smooth blue fills `#0071E3` when checked with crisp optical iconography; gentle slate border `#86868B` when idle.

### Navigation Header
- **Minimalist Top Bar:** Dual modes available—either full translucent frosted glass (`rgba(255, 255, 255, 0.8)` with blur) or sleek executive obsidian (`rgba(29, 29, 31, 0.85)` with blur and white typography) spanning edge-to-edge with a hairline bottom separator.