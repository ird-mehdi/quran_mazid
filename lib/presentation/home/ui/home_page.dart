import 'package:flutter/material.dart';
import 'package:quran_mazid_app/core/di/service_locator.dart';
import 'package:quran_mazid_app/core/external_libs/presentable_widget_builder.dart';
import 'package:quran_mazid_app/presentation/home/presenter/home_presenter.dart';
import 'package:quran_mazid_app/presentation/home/widgets/surah_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePresenter presenter = locator<HomePresenter>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Mazid'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        backgroundColor: const Color(0xFFFDFAF3),
      ),
      body: PresentableWidgetBuilder<HomePresenter>(
        presenter: presenter,
        builder: () {
          if (presenter.currentUiState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFDFAF3)),
              ),
            );
          }

          if (presenter.currentUiState.userMessage?.isNotEmpty ?? false) {
            return Center(child: Text(presenter.currentUiState.userMessage!));
          }

          final surahList = presenter.currentUiState.surahNameList;
          if (surahList == null || surahList.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          return SuraListScreen(
            surahs: presenter.currentUiState.surahNameList ?? [],
          );
        },
      ),
    );
  }
}
