import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'promo_model.dart';
export 'promo_model.dart';

class PromoWidget extends StatefulWidget {
  const PromoWidget({super.key});

  @override
  State<PromoWidget> createState() => _PromoWidgetState();
}

class _PromoWidgetState extends State<PromoWidget> {
  late PromoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: Image.asset(
                  'assets/images/MOBIL_PEKARYA_TEMA_LEBARAN-01.jpg',
                ).image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
