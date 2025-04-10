import 'package:flutter/material.dart';
import 'package:gmask_app/core/app_colors.dart';
import 'package:gmask_app/core/app_text_styles.dart';
import 'package:gmask_app/presentation/screens/market/market_screen.dart';

/// Виджет экрана избранного
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      final List<Product> products = [
    Product(
      imageUrl:
                    "https://s3-alpha-sig.figma.com/img/9894/1a21/4acdf859f28f6a499d5ff714f4d009bc?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=jo2P4cT3VDPahcQRJv~1eNnjFpk-NffNjNCSU5EuMFjthFKfiMdgxa1hIpTga21Ej3FshPg-Std-yITAn1teeRBNsO9YMuQ~L562JAfModstCYq6wCF8plpJA~VjyxqbQCF-efB3VctDVLCOoEa7~4MEPewCmzTErTlI1kSd9nJaDevYYaw3rykql0Q2kUc2TZhQhgI7~BnuKQdcBfEfN3glD4S2pJ~lqJ2DfumCyDLJQF7t7K0tw1gPE8L~qva0B2u0CuyGQZuuoQptfq9RT6NTa8GdNyGUznCe559tLN0aPsRbqHmBh2dgYAYt~~vaegyUsnYR5ScZAfpUIvPG-g__",
      title: 'Диски модели XPL 4211',
      description:
          'Была произведена полировка кузова Mercedes Benz (текст для за)',
      price: '100 000 тг.',
      isFavorited: false,
    ),
    Product(
      imageUrl: 'https://s3-alpha-sig.figma.com/img/0c46/1114/f58d0708f19c93bf118713802dcd321e?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ghCpHlcVui93CzW-yWK32br~t26Z10KprZJ9Ks4TUwoCElwIJ6yHfwvAOSd6oSY7CCXzrG6Gc7BDEg5MNicX54SiP42sNlOptr-4KuTRW1YnEy~TJ6~TmY6z0wnDqSa60MieDGQg1DDUww5WDT91~B6MyxJ9f6seKGwVubscTNMkj~1bdUKB27mu~6aSLohQtTfC~NupLL2zKPHMeZULnIPw-fMOeKsaOVwMel1aZdoq695d~W5Iv8SLReu5RnAg3-fWrpacL0tuIpm~HlyrZ3w3RrMu72EqdSbwgA9qTUVCqE2M5r4giiviaTOyVIqXuf~LRgTMjnUOjXJ071ZlQg__',
      title: 'PWF Exclusive Line',
      description: 'Эксклюзивность заключается не только в названии. Этот исключительный ассортимент д',
price: '130 000 тг.',      isFavorited: false,
      isAvailable: true,
    ),
    Product(
      imageUrl: 'https://s3-alpha-sig.figma.com/img/a35e/e44e/76cffbd2410a8cb73219800becb2c973?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=sL9LpBXXJX2yDyscj5ttGTOj5jRMGbc-K7c3O7jO2IJl~4EqP1FX2s9NyB53JkU~QcIqX2qdL1c7DJ-mErbDlGwU4FE2q5ZyJ35Jxs~q6MuANqkf0GISevvTnIeuK36rZbOnIt0wq5IjVhj91piaRtscS46f5PDWv2Io7jlKUXwEUUJwkEstwmFEGrnhpmLsVEpp0~Z8gYorg~xgCL1crA5OGYufz-FnSTGFxAOzWH~t7BpD77g5oZUvZ6aPTrwv5aN4-LA9qNinW78Nh219DJzlTtmjsbAy3LDAkSVnQgM~p6GG1al0xKCPpJ7IwfHbN5ydal9bblX5LMBIxLq6dA__',
      title: 'Автовинил PWF Quicksand ',
      description: 'Эксклюзивность заключается не только в названии. Этот исключительный ассортимент д',
price: '110 000 тг.',      isFavorited: true,
      isAvailable: true,
    ),
    Product(
      imageUrl: 'https://s3-alpha-sig.figma.com/img/eb82/d95e/2b0698ac5a754d628a5a7ed6ff998ba9?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SavQLuDr0nZ30A-BzP4OsB1i4JY7xgELs38S-k00YcinyY8YsnDgiLRMpfMqeYyDAgOjYiIsalbBxBeFyHyd6zJDyOQdtiVf4YK81fOtLDAbCs07afHMpWeKQRMU3bmKkWJiORRg8dT1sZz-AZXfCtzlCIDlsCqZRv1bNx~aelrz5pUuQ8GaYQG6FHbe-w6G8Qa79-mJ3~4TSUkhhJx7xEDAxby2CVNpK5SFrNoyJRgow7HEJKQxymKmAW8FLwWhnJCXMh2-SxUH5XHPiQHqFHDBQ7mKZ-r7jLX7e2mUHNnztA4bVQCe5YeP~onI0SgGMfJ9unlMyiAGjt22aEqjlQ__',
      title: 'Автовинил PWF Olea Green',
      description: 'Эксклюзивность заключается не только в названии. Этот исключительный ассортимент д',
price: '120 000 тг.',      isFavorited: false,
      isAvailable: false, // Нет в наличии
    ),
  ];

    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(
              width: 12,
            ),
            Text("Назад", style: AppTextStyles.px16W400PrimaryText),
          ],
        ),
        actions: const [], // Empty actions to maintain standard AppBar layout
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:  16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ProductCard(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}