import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/injection.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_event.dart';
import '../bloc/bloc_state.dart';

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
                  child: ListView.separated(
                      itemBuilder: (context, int index) {
                        return ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Center(
                              child: Text(state.advice.slip.id.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            ),
                          ),
                          title: Text(state.advice.slip.advice!,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        );
                      },
                      separatorBuilder: (_, __) => Divider(),
                      itemCount: 1),
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
