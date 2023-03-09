import 'package:dogs/bloc/get_cats_bloc.dart';
import 'package:dogs/bloc/get_dogs_bloc.dart';
import 'package:dogs/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;
  List<Widget> pages = [DogsPage(), CatsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomSlidingToggle(
            leftLabel: 'Dogs',
            rightLabel: 'Cats',
            onChange: (val) {
              _currentIndex = val;
              setState(() {});
              print(val);
            },
          ),
        ),
        body: pages[_currentIndex]);
  }
}

class DogsPage extends StatefulWidget {
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  int _currentVal = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              NumberPicker(
                  minValue: 1,
                  maxValue: 50,
                  value: _currentVal,
                  onChanged: (val) {
                    _currentVal = val;
                    setState(() {});
                  }),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<GetDogsBloc>(context).add(
                    GetAnimalEvent(
                      count: _currentVal,
                    ),
                  );
                },
                child: const Text('get image'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Expanded(
            child: BlocBuilder<GetDogsBloc, AnimalState>(
              builder: (context, state) {
                if (state is AnimalSuccess) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.model?.message?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Image.network(
                          state.model?.message?[index] ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CatsPage extends StatelessWidget {
  const CatsPage({super.key});

  @override
  Widget build(BuildContext context) {
      int _currentVal = 1;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              NumberPicker(
                  minValue: 1,
                  maxValue: 50,
                  value: _currentVal,
                  onChanged: (val) {
                    _currentVal = val;
                  }),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<GetCatsBloc>(context).add(
                    GetAnimalEvent(
                      count: 0,
                    ),
                  );
                },
                child: const Text('get image'),
              ),
            ],
          ),
          const SizedBox(height: 25),
          BlocBuilder<GetCatsBloc, AnimalState>(
            builder: (context, state) {
              
              if (state is AnimalSuccess) {
                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.network(
                        state.modelCat?.file?? '',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
