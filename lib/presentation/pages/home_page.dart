import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/injection.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_event.dart';
import '../bloc/bloc_state.dart';
import '../widgets/list_view_advices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Advice'),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: getIt.get<RandomAdviceBloc>()..add(FetchRandomAdvice()),
        builder: (context, state) {
          if (state is RandomAdviceHasData) {
            return RefreshIndicator(
                onRefresh: () async =>
                    getIt.get<RandomAdviceBloc>()..add(PullToRefreshEvent()),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RandomAdviceListViewWidget(
                    advice: state.advice,
                  ),
                ));
          } else if (state is RandomAdviceIsError) {
            return Container();
          } else if (state is RandomAdviceIsEmpty) {
            return CircularProgressIndicator();
          } else {
            return const Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }
}
