import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_1/pages/course/paywebview/bloc/payview_blocs.dart';
import 'package:ulearning_1/pages/course/paywebview/bloc/payview_events.dart';
import 'package:ulearning_1/pages/course/paywebview/bloc/payview_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/widgets/base_text_widgets.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({super.key});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    //final args = ModalRoute.of(context)!.settings.arguments as Map;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    context.read<PayWebViewBlocs>().add(TriggerWebView(args["url"]));
  }

  @override
  void dispose(){
    webViewController.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBlocs, PayWebViewStates>(
        builder: (context, state) {
      return Scaffold(
        appBar:  buildAppBar("Payment"),

        body:state.url == ""? SizedBox(
          width: 50.w,
          height: 50.h,
          child: CircularProgressIndicator(),
        ): WebView(
          initialUrl: state.url,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            JavascriptChannel(
              name: "Pay",
              onMessageReceived: (JavascriptMessage message){
                print(message.message);
                Navigator.of(context).pop(message.message);
              }
            ),
          },
          onWebViewCreated: (WebViewController w){
            webViewController = w;
          },
        ),
      );
    });
  }
}
