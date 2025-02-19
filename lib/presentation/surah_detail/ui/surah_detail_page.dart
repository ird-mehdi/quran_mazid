import 'package:flutter/material.dart';
import 'package:quran_mazid_app/core/di/service_locator.dart';
import 'package:quran_mazid_app/core/external_libs/presentable_widget_builder.dart';
import 'package:quran_mazid_app/presentation/surah_detail/presenter/surah_detail_presenter.dart';
import 'package:quran_mazid_app/presentation/surah_detail/widgets/ayah_item.dart';
import 'package:quran_mazid_app/presentation/surah_detail/widgets/audio_player_widget.dart';

class SurahDetailPage extends StatelessWidget {
  const SurahDetailPage({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });
  final int surahNumber;
  final String surahName;

  @override
  Widget build(BuildContext context) {
    final SurahDetailPresenter presenter = locator<SurahDetailPresenter>();
    return Scaffold(
      backgroundColor: const Color(0xFFFDFAF3),
      appBar: AppBar(
        title: Text(surahName),
        centerTitle: true,
        backgroundColor: const Color(0xFFFDFAF3),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PresentableWidgetBuilder<SurahDetailPresenter>(
              presenter: presenter,
              onInit: () => presenter.getAyahById(surahNumber),
              builder: () => _buildAyahList(presenter),
            ),
          ),
          AudioPlayerWidget(surahNumber: surahNumber),
        ],
      ),
    );
  }

  Widget _buildAyahList(SurahDetailPresenter presenter) {
    if (presenter.currentUiState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFDFAF3)),
        ),
      );
    }
    return ListView.builder(
      itemCount: presenter.currentUiState.surahList?.length ?? 0,
      itemBuilder: (context, index) {
        final ayah = presenter.currentUiState.surahList?[index];
        if (ayah == null) return const SizedBox.shrink();

        return AyahItem(ayah: ayah, index: index);
      },
    );
  }
}
