import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter_web/app/ui/global_widgets/appbar.dart';
import 'package:portfolio_flutter_web/app/ui/global_widgets/responsive_content.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_projects.dart';
import 'package:portfolio_flutter_web/app/ui/global_widgets/project_card.dart';
import 'package:portfolio_flutter_web/app/ui/global_widgets/projects_grid_widget.dart';
import 'package:portfolio_flutter_web/app/ui/global_widgets/shimmer_image.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/about_me/me_and_projects.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/certificates/certificates.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/contact_me/contact_me.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/diplomas/diplomas.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/top_section/top_section.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/work_experience/work_experience.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/work_instruments/widgets/big_circle_icon_widget.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/work_instruments/widgets/small_circle_icon.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/work_instruments/work_instruments.dart';
import 'package:portfolio_flutter_web/app/ui/project_page/project_page.dart';
import 'package:portfolio_flutter_web/app/ui/projects_page/sections/projects_list/projects_list.dart';
import 'package:portfolio_flutter_web/app/ui/projects_page/sections/top_section/top_section_projects.dart';
import 'package:portfolio_flutter_web/app/ui/theme/app_fonts.dart';
import 'package:portfolio_flutter_web/app/ui/theme/responsive.dart';

class _HomeShellHarness extends StatefulWidget {
  const _HomeShellHarness();

  @override
  State<_HomeShellHarness> createState() => _HomeShellHarnessState();
}

class _HomeShellHarnessState extends State<_HomeShellHarness> {
  final ScrollController controller = ScrollController();
  final GlobalKey heroKey = GlobalKey();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        needBack: false,
        controller: controller,
        homeHeroKey: heroKey,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        children: [
          TopSection(key: heroKey, controller: controller),
          const SizedBox(height: 1000, child: Text('After hero')),
        ],
      ),
    );
  }
}

void setTestViewport(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Future<void> boundedPump(
  WidgetTester tester, {
  Duration duration = const Duration(milliseconds: 100),
}) async {
  await tester.pump();
  await tester.pump(duration);
}

void expectNoFlutterExceptions(WidgetTester tester, {String? context}) {
  final exceptions = <Object>[];
  Object? exception;
  while ((exception = tester.takeException()) != null) {
    exceptions.add(exception!);
  }
  expect(
    exceptions,
    isEmpty,
    reason: [if (context != null) context, ...exceptions.map((e) => '$e')]
        .join('\n\n'),
  );
}

void main() {
  test('responsive primitives classify viewport widths', () {
    expect(
      ResponsiveLayout.viewportClass(767),
      ResponsiveViewportClass.mobile,
    );
    expect(
      ResponsiveLayout.viewportClass(768),
      ResponsiveViewportClass.tablet,
    );
    expect(
      ResponsiveLayout.viewportClass(1199),
      ResponsiveViewportClass.tablet,
    );
    expect(
      ResponsiveLayout.viewportClass(1200),
      ResponsiveViewportClass.desktop,
    );

    expect(ResponsiveLayout.pagePadding(390), 16);
    expect(ResponsiveLayout.pagePadding(768), 32);
    expect(ResponsiveLayout.pagePadding(1200), 0);

    expect(ResponsiveLayout.heading1Size(390), 36);
    expect(ResponsiveLayout.heading1Size(768), 48);
    expect(ResponsiveLayout.heading1Size(1200), 60);
    expect(ResponsiveLayout.heading2Size(390), 26);
    expect(ResponsiveLayout.bodySize(390), 16);
    expect(ResponsiveLayout.heroTitleSize(390), 48);
    expect(ResponsiveLayout.heroTitleSize(768), 64);
    expect(ResponsiveLayout.heroTitleSize(1200), 90);

    expect(responsiveHeading1(390).fontSize, 36);
    expect(responsiveHeading2(768).fontSize, 32);
    expect(responsiveHeading2Bold(1200).fontSize, 36);
    expect(responsiveBody(390).fontSize, 16);
  });

  testWidgets('responsive content respects compact padding', (tester) async {
    setTestViewport(tester, const Size(320, 640));

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ResponsiveContent(
            child: SizedBox(key: Key('content'), height: 20),
          ),
        ),
      ),
    );
    await boundedPump(tester);

    expect(tester.getSize(find.byKey(const Key('content'))).width, 288);
    expectNoFlutterExceptions(tester);
  });

  testWidgets('home core sections fit compact widths', (tester) async {
    const sizes = [
      Size(320, 900),
      Size(360, 900),
      Size(390, 900),
      Size(430, 900),
      Size(768, 1000),
      Size(1024, 1000),
      Size(1440, 1000),
    ];

    const components = <String, Widget>{
      'about-projects': MeAndProjects(),
      'work-experience': WorkExperience(),
      'work-instruments': WorkInstruments(),
    };

    for (final size in sizes) {
      for (final entry in components.entries) {
        setTestViewport(tester, size);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(child: entry.value),
            ),
          ),
        );
        await boundedPump(tester, duration: const Duration(milliseconds: 350));
        expectNoFlutterExceptions(
          tester,
          context: '${entry.key} at ${size.width}x${size.height}',
        );
        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      }
    }

    setTestViewport(tester, const Size(320, 900));
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: ResponsiveContent(
              child: ProjectsGridWidget(projects: projects, count: 1),
            ),
          ),
        ),
      ),
    );
    await boundedPump(tester);
    expect(find.byKey(const Key('projects-one-column')), findsOneWidget);
    expect(find.byKey(const Key('projects-two-column')), findsNothing);
    final compactCard = find.byType(ProjectCard).first;
    expect(tester.getSize(compactCard).width, 288);
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    setTestViewport(tester, const Size(1440, 1000));
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 1200,
              child: ProjectsGridWidget(projects: projects, count: 4),
            ),
          ),
        ),
      ),
    );
    await boundedPump(tester);
    expect(find.byKey(const Key('projects-two-column')), findsOneWidget);
    expect(find.byKey(const Key('projects-one-column')), findsNothing);
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    setTestViewport(tester, const Size(320, 900));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: WorkExperience()),
        ),
      ),
    );
    await boundedPump(tester);
    expect(find.byKey(const Key('work-timeline-mobile')), findsOneWidget);
    expect(find.byKey(const Key('work-timeline-scroll')), findsNothing);
    expectNoFlutterExceptions(tester);
  });

  testWidgets('mobile home sections use intentional column counts',
      (tester) async {
    setTestViewport(tester, const Size(754, 1178));

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: WorkExperience()),
        ),
      ),
    );
    await boundedPump(tester, duration: const Duration(milliseconds: 350));

    expect(find.byKey(const Key('work-timeline-mobile')), findsOneWidget);
    expect(find.byKey(const Key('work-timeline-scroll')), findsNothing);

    final mobileEvents = find.byKey(const Key('mobile-work-event-0'));
    expect(mobileEvents, findsOneWidget);
    expect(find.byKey(const Key('mobile-work-event-5')), findsOneWidget);
    expect(
      tester.getTopLeft(find.byKey(const Key('mobile-work-event-5'))).dy,
      greaterThan(tester.getTopLeft(mobileEvents).dy),
      reason: 'Mobile work history must flow vertically.',
    );
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    setTestViewport(tester, const Size(754, 1178));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: WorkInstruments()),
        ),
      ),
    );
    await boundedPump(tester, duration: const Duration(milliseconds: 500));

    final topIcons = find.byType(BigCircleIcon);
    expect(topIcons, findsNWidgets(5));
    expect(
      tester.getTopLeft(topIcons.at(2)).dy,
      greaterThan(tester.getTopLeft(topIcons.at(0)).dy),
      reason: 'Mobile primary tools must use at most two columns.',
    );

    final smallIcons = find.byType(SmallCircleIcon);
    expect(smallIcons, findsWidgets);
    expect(
      tester.getTopLeft(smallIcons.at(4)).dy,
      greaterThan(tester.getTopLeft(smallIcons.at(0)).dy),
      reason: 'Mobile secondary tools must use at most four columns.',
    );
    expectNoFlutterExceptions(tester);
  });

  testWidgets('async home sections preserve vertical order', (tester) async {
    setTestViewport(tester, const Size(754, 1178));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const WorkExperience(),
                const WorkInstruments(),
                const DiplomasWidget(),
                CertificatesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    void expectSectionsInOrder() {
      const keys = [
        Key('work-experience-section'),
        Key('work-instruments-section'),
        Key('diplomas-section'),
        Key('certificates-section'),
      ];
      for (var index = 0; index < keys.length - 1; index++) {
        final current = tester.getRect(find.byKey(keys[index]));
        final next = tester.getRect(find.byKey(keys[index + 1]));
        expect(
          current.bottom,
          lessThanOrEqualTo(next.top),
          reason: '${keys[index]} must not paint into ${keys[index + 1]}.',
        );
      }
    }

    expectSectionsInOrder();

    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byKey(const Key('small-icons-grid')), findsOneWidget);
    expectSectionsInOrder();
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });

  testWidgets('credentials and contact adapt to compact widths',
      (tester) async {
    const sizes = [
      Size(320, 900),
      Size(390, 900),
      Size(768, 1000),
      Size(1024, 1000),
      Size(1440, 1000),
    ];

    for (final size in sizes) {
      final widgets = <Widget>[
        const DiplomasWidget(),
        CertificatesWidget(),
        const ContactMe(),
      ];
      for (final widget in widgets) {
        setTestViewport(tester, size);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(child: widget),
            ),
          ),
        );
        await boundedPump(tester, duration: const Duration(milliseconds: 350));
        expectNoFlutterExceptions(
          tester,
          context: '${widget.runtimeType} at ${size.width}x${size.height}',
        );
        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      }
    }

    setTestViewport(tester, const Size(320, 900));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: ContactMe()),
        ),
      ),
    );
    await boundedPump(tester);
    expect(find.byKey(const Key('contact-socials-compact')), findsOneWidget);
    expect(find.byKey(const Key('contact-inputs-compact')), findsOneWidget);
    for (final element in find.byType(ElevatedButton).evaluate()) {
      expect(tester.getSize(find.byWidget(element.widget)).height,
          greaterThanOrEqualTo(48));
    }
    for (final element in find.byType(TextFormField).evaluate()) {
      expect(tester.getSize(find.byWidget(element.widget)).width,
          lessThanOrEqualTo(240));
    }
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    setTestViewport(tester, const Size(390, 900));
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: CertificatesWidget()),
        ),
      ),
    );
    await boundedPump(tester);
    expect(find.byKey(const Key('certificates-compact-stack')), findsOneWidget);
    expect(
        find.byKey(const Key('certificates-carousel-compact')), findsOneWidget);
    expect(find.byIcon(Icons.keyboard_arrow_right_outlined), findsOneWidget);
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    setTestViewport(tester, const Size(1440, 1000));
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: CertificatesWidget()),
        ),
      ),
    );
    await boundedPump(tester);
    expect(find.byKey(const Key('certificates-desktop-row')), findsOneWidget);
    expect(
        find.byKey(const Key('certificates-carousel-desktop')), findsOneWidget);
    expectNoFlutterExceptions(tester);
  });

  testWidgets('projects route search and filters stay responsive',
      (tester) async {
    const sizes = [
      Size(320, 900),
      Size(390, 900),
      Size(768, 1000),
      Size(1024, 1000),
      Size(1440, 1000),
    ];

    for (final size in sizes) {
      setTestViewport(tester, size);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(child: ProjectsList()),
          ),
        ),
      );
      await boundedPump(tester, duration: const Duration(milliseconds: 250));
      expect(find.byKey(const Key('projects-filter-wrap')), findsOneWidget);
      if (size.width < 1200) {
        expect(find.byKey(const Key('projects-one-column')), findsOneWidget);
      } else {
        expect(find.byKey(const Key('projects-two-column')), findsOneWidget);
      }
      expectNoFlutterExceptions(tester,
          context: 'ProjectsList at ${size.width}');
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    }

    setTestViewport(tester, const Size(320, 900));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: ProjectsList()),
        ),
      ),
    );
    await boundedPump(tester);
    final field = find.byType(TextFormField).first;
    expect(tester.getSize(field).width, lessThanOrEqualTo(288));

    await tester.enterText(field, 'Revolit0');
    await tester.pump();
    expect(find.byType(ProjectCard), findsOneWidget);
    expectNoFlutterExceptions(tester);

    await tester.enterText(field, 'no-such-project');
    await tester.pump();
    expect(find.byType(ProjectCard), findsNothing);
    expectNoFlutterExceptions(tester);

    await tester.enterText(field, '');
    await tester.pump();
    expect(find.byType(ProjectCard), findsWidgets);
    expectNoFlutterExceptions(tester);
  });

  testWidgets('project detail stacks and scrolls on compact screens',
      (tester) async {
    const sizes = [
      Size(320, 568),
      Size(360, 800),
      Size(390, 844),
      Size(430, 900),
      Size(768, 1024),
      Size(1024, 900),
      Size(1440, 900),
    ];

    for (final size in sizes) {
      setTestViewport(tester, size);
      await tester.pumpWidget(
        MaterialApp(home: ProjectPage(project: projects.first)),
      );
      await boundedPump(tester, duration: const Duration(milliseconds: 300));
      expect(find.text(projects.first.title), findsOneWidget);
      expect(find.text('Описание'), findsOneWidget);
      if (size.width < 1200) {
        expect(find.byKey(const Key('project-detail-compact-scroll')),
            findsOneWidget);
        expect(find.byKey(const Key('project-images-compact')), findsOneWidget);
        expect(find.byKey(const Key('project-description-compact')),
            findsOneWidget);
      } else {
        expect(find.byKey(const Key('project-detail-desktop-row')),
            findsOneWidget);
        expect(find.byKey(const Key('project-images-desktop')), findsOneWidget);
        expect(find.byKey(const Key('project-description-desktop')),
            findsOneWidget);
      }
      expectNoFlutterExceptions(tester,
          context: 'ProjectPage at ${size.width}');
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    }

    setTestViewport(tester, const Size(320, 568));
    await tester.pumpWidget(
      MaterialApp(home: ProjectPage(project: projects.first)),
    );
    await boundedPump(tester);
    if (projects.first.page.images.length > 1) {
      await tester.tap(find.byKey(const Key('project-image-indicator-1')));
      await tester.pump(const Duration(milliseconds: 400));
    }
    await tester.drag(
      find.byKey(const Key('project-detail-compact-scroll')),
      const Offset(0, -500),
    );
    await tester.pump();
    expect(find.textContaining('Дата работы:'), findsOneWidget);
    expectNoFlutterExceptions(tester);
  });

  testWidgets('app bar and heroes adapt across viewport classes',
      (tester) async {
    const compactSizes = [
      Size(320, 568),
      Size(390, 844),
      Size(768, 1024),
      Size(1024, 900),
    ];

    for (final size in compactSizes) {
      setTestViewport(tester, size);
      await tester.pumpWidget(
        const MaterialApp(home: _HomeShellHarness()),
      );
      await boundedPump(tester, duration: const Duration(milliseconds: 250));

      expect(find.byKey(const Key('compact-nav-menu')), findsOneWidget);
      expect(find.byKey(const Key('compact-home-hero-text')), findsOneWidget);
      expect(
          find.byKey(const Key('compact-home-hero-artwork')), findsOneWidget);
      expectNoFlutterExceptions(tester);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    }

    setTestViewport(tester, const Size(390, 844));
    await tester.pumpWidget(
      const MaterialApp(home: _HomeShellHarness()),
    );
    await boundedPump(tester);
    await tester.tap(find.byKey(const Key('compact-nav-menu')));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('Обо мне'), findsOneWidget);
    final aboutMenuItem = find.ancestor(
      of: find.text('Обо мне'),
      matching: find.byWidgetPredicate(
        (widget) => widget.runtimeType.toString().startsWith('PopupMenuItem'),
      ),
    );
    expect(aboutMenuItem, findsOneWidget);
    final dynamic menu =
        tester.widget(find.byKey(const Key('compact-nav-menu')));
    final dynamic item = tester.widget(aboutMenuItem);
    menu.onSelected(item.value);
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    final homeScrollable =
        tester.state<ScrollableState>(find.byType(Scrollable).first);
    expect(homeScrollable.position.pixels, greaterThan(0));
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    setTestViewport(tester, const Size(390, 844));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(child: TopSectionProjects()),
        ),
      ),
    );
    await boundedPump(tester, duration: const Duration(milliseconds: 250));
    expect(find.byKey(const Key('compact-projects-title')), findsOneWidget);
    expect(find.byKey(const Key('compact-projects-artwork')), findsOneWidget);
    expectNoFlutterExceptions(tester);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    setTestViewport(tester, const Size(1440, 900));
    await tester.pumpWidget(
      const MaterialApp(home: _HomeShellHarness()),
    );
    await boundedPump(tester, duration: const Duration(milliseconds: 250));
    expect(find.byKey(const Key('compact-nav-menu')), findsNothing);
    expect(find.text('Главная'), findsOneWidget);
    expect(find.text('Все Проекты'), findsOneWidget);
    expectNoFlutterExceptions(tester);
  });

  testWidgets('compact hero artwork stays pinned to viewport bottom',
      (tester) async {
    const sizes = [
      Size(390, 844),
      Size(674, 1278),
      Size(754, 1170),
    ];

    for (final size in sizes) {
      setTestViewport(tester, size);
      await tester.pumpWidget(
        const MaterialApp(home: _HomeShellHarness()),
      );
      await boundedPump(tester, duration: const Duration(milliseconds: 250));

      final artwork = find.byKey(const Key('compact-home-hero-artwork'));
      final text = find.byKey(const Key('compact-home-hero-text'));
      final avatar = find.byWidgetPredicate(
        (widget) =>
            widget is ShimmerImage &&
            widget.assetName == 'assets/images/me_photo.png',
      );
      final artworkTop = tester.getTopLeft(artwork).dy;
      final artworkBottom = tester.getBottomRight(artwork).dy;
      final textBottom = tester.getBottomRight(text).dy;
      final artworkHeight = tester.getSize(artwork).height;
      final avatarBottom = tester.getBottomRight(avatar).dy;
      final avatarWidth = tester.getSize(avatar).width;
      final minimumArtworkHeight = size.width < 500 ? 180.0 : 360.0;

      expect(
        artworkBottom,
        closeTo(size.height, 1),
        reason: 'Artwork must meet the viewport bottom at '
            '${size.width}x${size.height}',
      );
      expect(
        artworkTop,
        greaterThanOrEqualTo(textBottom),
        reason: 'Hero text and artwork must not overlap at '
            '${size.width}x${size.height}',
      );
      expect(
        artworkHeight,
        greaterThanOrEqualTo(minimumArtworkHeight),
        reason: 'Bottom alignment must not collapse the hero artwork at '
            '${size.width}x${size.height}',
      );
      expect(
        avatarBottom,
        closeTo(size.height, 1),
        reason: 'The avatar itself must meet the viewport bottom at '
            '${size.width}x${size.height}',
      );
      expect(
        avatarWidth,
        greaterThanOrEqualTo(artworkHeight * 0.6),
        reason: 'Responsive artwork padding must not collapse the avatar at '
            '${size.width}x${size.height}',
      );
      expectNoFlutterExceptions(
        tester,
        context: 'bottom-aligned hero at ${size.width}x${size.height}',
      );

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    }
  });

  testWidgets('hero stays overflow-free on short and desktop viewports',
      (tester) async {
    const sizes = [
      Size(320, 568),
      Size(1440, 900),
    ];

    for (final size in sizes) {
      setTestViewport(tester, size);
      await tester.pumpWidget(
        const MaterialApp(home: _HomeShellHarness()),
      );
      await boundedPump(tester, duration: const Duration(milliseconds: 250));

      final heroBottom = tester.getBottomRight(find.byType(TopSection)).dy;
      expect(heroBottom, greaterThanOrEqualTo(size.height));
      if (size.width >= ResponsiveLayout.desktopBreakpoint) {
        final avatar = find.byWidgetPredicate(
          (widget) =>
              widget is ShimmerImage &&
              widget.assetName == 'assets/images/me_photo.png',
        );
        expect(tester.getBottomRight(avatar).dy, closeTo(size.height, 1));
      }
      expectNoFlutterExceptions(
        tester,
        context: 'hero overflow check at ${size.width}x${size.height}',
      );

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    }
  });
}
