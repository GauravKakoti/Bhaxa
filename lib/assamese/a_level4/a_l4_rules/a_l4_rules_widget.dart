import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_l4_rules_model.dart';
export 'a_l4_rules_model.dart';

class AL4RulesWidget extends StatefulWidget {
  const AL4RulesWidget({Key? key}) : super(key: key);

  @override
  _AL4RulesWidgetState createState() => _AL4RulesWidgetState();
}

class _AL4RulesWidgetState extends State<AL4RulesWidget> {
  late AL4RulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AL4RulesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AL4Rules'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('A_L4_RULES_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed('AssameseLevel4');
            },
          ),
          title: Text(
            'BHAXA',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'PHRASES',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 36.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'English',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'I understand\n\nI don\'t understand\n\nI don\'t know\n\nDo you speak English?\n\n\nDo you speak Assamese?\n\nYes, a little\n\nPlease\n\nThank you\n\nChristmas greetings\n\nNew Year greetings\n\nBihu greetings\n\n\nEid greeting\n\n\nBirthday greetings\n',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Assamese',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          '\tমই বুজি পাওঁ (môi buzi paû)\n\nমই বুজি নাপাওঁ (môi buzi napaû)\n\n\tমই নাজানো (môi najanu)\n\nআপুনি ইংৰাজী কয়নে?\n(apuni iŋrazi kôyne?)\n\nআপুনি অসমীয়া কয়নে?\n(apuni ôxômiya kôyne?)\n\nহয়, অলপ (hôy, ôlôp)\n\nঅনুগ্ৰহ কৰি\n(ônugrôh kôri)\n\nধন্যবাদ (dhônyôbad)\n\nমেৰী খ্রীষ্টমাচ (meri khristmas)\n\nশুভ নৱবৰ্ষৰ (xubhô nôwôbôrxô)\n\nবিহুৰ শুভেচ্ছা যাছিলোঁ/শুভ বিহু!\n(bihur xubhesssa zasilû/xubhô bihu!)\n\nঈদ মোবাৰক\n(eid mûbarôk!)\n\nজন্মদিনৰ শুভেচ্ছা\n(zônmôdinôr xubhesssa)\n',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
