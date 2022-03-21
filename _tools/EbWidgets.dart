// Packages
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
// _tools
import '../_tools/EbUI.dart';

//================================================
class EbScaffold extends StatefulWidget {
  EbScaffold({
    this.onWillPop,
    this.onConnectivityUpdate,
    this.loading = false,
    this.loadingWidget,
    this.appBar,
    this.body,
  });

  Future<bool> Function()? onWillPop;
  void Function(bool online)? onConnectivityUpdate;
  final bool loading;
  Widget? loadingWidget;
  PreferredSizeWidget? appBar;
  Widget? body;

  @override
  State<EbScaffold> createState() => _EbScaffold();
}

class _EbScaffold extends State<EbScaffold> {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  // state
  @override
  void initState() {
    // init connectivity
    (() async {
      _online(await (Connectivity().checkConnectivity()));
    })();
    // connectivity listener
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _online(result);
    });
    super.initState();
  }

  //
  @override
  dispose() {
    super.dispose();
    connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onWillPop ??= () async => true,
      child: Scaffold(
        appBar: widget.appBar ??= null,
        body: EbLoading(
          loading: widget.loading,
          loadingWidget: (widget.loadingWidget ??= Center(
            child: CircularProgressIndicator(
              color: EbUI.colors.primaryDark,
              backgroundColor: EbUI.colors.primaryLight,
            ),
          )),
          child: (widget.body ??= null),
        ),
      ),
    );
  }

  //
  void _online(ConnectivityResult result) {
    bool online = false;
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.mobile) {
      online = true;
    }
    if (widget.onConnectivityUpdate != null) {
      widget.onConnectivityUpdate!(online);
    }
  }
}

//================================================
class EbLoading extends StatelessWidget {
  EbLoading({
    this.loading = false,
    this.loadingWidget,
    this.child,
  });
  final bool loading;
  Widget? loadingWidget;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (loading == true
          ? loadingWidget ??= Center(
              child: CircularProgressIndicator(
                color: EbUI.colors.primaryDark,
                backgroundColor: EbUI.colors.primaryLight,
              ),
            )
          : child ??= null),
    );
  }
}

//================================================
class EbPage extends StatelessWidget {
  EbPage({
    this.shrink = true,
    this.headerRow,
    this.contentColumn,
    this.footerRow,
  });
  final bool shrink;
  List<Widget>? headerRow;
  List<Widget>? contentColumn;
  List<Widget>? footerRow;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          mainAxisSize: (shrink == true ? MainAxisSize.min : MainAxisSize.max),
          children: [
            Row(
              mainAxisSize:
                  (shrink == true ? MainAxisSize.min : MainAxisSize.max),
              children: (headerRow ??= []),
            ),
            (shrink == true
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: (contentColumn ??= []),
                  )
                : Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: (contentColumn ??= []),
                    ),
                  )),
            Row(
              mainAxisSize:
                  (shrink == true ? MainAxisSize.min : MainAxisSize.max),
              children: (footerRow ??= []),
            ),
          ],
        ),
      ),
    );
  }
}

//================================================
class EbInput extends StatelessWidget {
  EbInput({
    this.controller,
    this.labelText,
    this.errorText,
    this.iconData,
    this.keyboardType,
    this.autofocus = false,
    this.readOnly = false,
    this.disabled = false,
    this.obscureText = false,
    this.validator,
  });
  final TextEditingController? controller;
  String? labelText;
  final String? errorText;
  final IconData? iconData;
  final TextInputType? keyboardType;
  final bool autofocus;
  final bool readOnly;
  final bool disabled;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText ??= ""),
        errorText: errorText,
        icon: Icon(iconData),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(EbUI.fontSize / 4),
        ),
      ),
      keyboardType: keyboardType,
      autofocus: autofocus,
      readOnly: readOnly,
      enabled: !disabled,
      obscureText: obscureText,
      validator: validator,
    );
  }
}

//================================================
  /*
class EbInputDate extends StatefulWidget {
  EbInputDate({
    this.controller,
    this.labelText,
    this.errorText,
    this.autofocus = false,
    this.readOnly = false,
    this.disabled = false,
    this.obscureText = false,
    this.validator,
  });

  final TextEditingController? controller;
  String? labelText;
  final String? errorText;
  final bool autofocus;
  final bool readOnly;
  final bool disabled;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<EbInputDate> createState() => _EbInputDate();
}

class _EbInputDate extends State<EbInputDate> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onWillPop ??= () async => true,
      child: Scaffold(
        appBar: widget.appBar ??= null,
        body: EbLoading(
          loading: widget.loading,
          loadingWidget: (widget.loadingWidget ??= Center(
            child: CircularProgressIndicator(
              color: EbUI.colors.primaryDark,
              backgroundColor: EbUI.colors.primaryLight,
            ),
          )),
          child: (widget.body ??= null),
        ),
      ),
    );
  }

  //
  void _online(ConnectivityResult result) {
    bool online = false;
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.ethernet ||
        result == ConnectivityResult.mobile) {
      online = true;
    }
    if (widget.onConnectivityUpdate != null) {
      widget.onConnectivityUpdate!(online);
    }
  }
}
  */
