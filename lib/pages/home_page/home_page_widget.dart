import '/components/logout/logout_widget.dart';
import '/components/mode/mode_widget.dart';
import '/components/support/support_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().greetings = 3;
      FFAppState().update(() {});
      if (FFAppState().leadsname != '') {
        context.goNamed('HomePage');
      } else {
        FFAppState().urlvirtualshowroom = 'http://172.16.6.34:81/Elegant/';
        FFAppState().greetings = 3;
        FFAppState().leadsname = '';
        FFAppState().startdate =
            DateTime.fromMillisecondsSinceEpoch(1702400400000);
        setState(() {});

        context.goNamed('Greetings');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Group_26086148.png',
                    height: 36.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang,',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Gothic A1',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Text(
                        FFAppState().leadsname,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Gothic A1',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: const SizedBox(
                                            height: 145.0,
                                            width: 220.0,
                                            child: SupportWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: Image.asset(
                                        'assets/images/customer-service-agent.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      AlignedTooltip(
                        content: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Pilih Style Showroom disini...',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Gothic A1',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        offset: 4.0,
                        preferredDirection: AxisDirection.down,
                        borderRadius: BorderRadius.circular(8.0),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        elevation: 4.0,
                        tailBaseWidth: 24.0,
                        tailLength: 12.0,
                        waitDuration: const Duration(milliseconds: 100),
                        showDuration: const Duration(milliseconds: 1500),
                        triggerMode: TooltipTriggerMode.tap,
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.switch_video,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: double.infinity,
                                        child: ModeWidget(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                      AlignedTooltip(
                        content: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Pilih Style Showroom disini...',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Gothic A1',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        offset: 4.0,
                        preferredDirection: AxisDirection.down,
                        borderRadius: BorderRadius.circular(8.0),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        elevation: 4.0,
                        tailBaseWidth: 24.0,
                        tailLength: 12.0,
                        waitDuration: const Duration(milliseconds: 100),
                        showDuration: const Duration(milliseconds: 1500),
                        triggerMode: TooltipTriggerMode.tap,
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 0.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.logout,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: double.infinity,
                                        child: LogoutWidget(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(width: 5.0)),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 1.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ],
              ),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              background: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowVideoPlayer(
                          path: 'assets/videos/background-web-VX.mp4',
                          videoType: VideoType.asset,
                          width: double.infinity,
                          autoPlay: true,
                          looping: true,
                          showControls: false,
                          allowFullScreen: false,
                          allowPlaybackSpeedMenu: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FlutterFlowWebView(
                content: FFAppState().urlvirtualshowroom,
                bypass: true,
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                verticalScroll: true,
                horizontalScroll: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
