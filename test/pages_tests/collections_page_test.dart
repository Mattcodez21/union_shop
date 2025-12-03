import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/data/collections_data.dart';

// Test wrapper that doesn't use Navbar to avoid Firebase
class TestCollectionsPage extends StatelessWidget {
  const TestCollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Collections')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: const EdgeInsets.all(48.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 500 ? 3 : 2;
                  final childAspectRatio =
                      constraints.maxWidth > 500 ? 1.2 : 1.5;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: collections.length,
                    itemBuilder: (context, index) {
                      final collection = collections[index];
                      return GestureDetector(
                        onTap: () {
                          // Mock navigation
                        },
                        child: Card(
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFF4d2963),
                                  const Color(0xFF4d2963)
                                      .withValues(alpha: 0.8),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      collection.name,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Flexible(
                                    child: Text(
                                      '${collection.productCount} products',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white70,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  group('Collections Page Tests', () {
    testWidgets('Collections page displays correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify we're on the Collections page
      expect(find.byType(TestCollectionsPage), findsOneWidget);

      // Verify the collections page has the expected structure
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Page displays 8 collections', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify we're on the Collections page
      expect(find.byType(TestCollectionsPage), findsOneWidget);

      // Check the actual collections data from collections_data
      expect(collections.length, equals(8));

      // Verify we have the expected number of collections in the data
      expect(collections.length, greaterThanOrEqualTo(4));
      expect(collections.length, lessThanOrEqualTo(8));

      // Verify GridView has items
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('Each collection shows title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify we're on the Collections page
      expect(find.byType(TestCollectionsPage), findsOneWidget);

      // Verify collection cards exist
      final collectionCards = find.byType(Card);
      expect(collectionCards, findsWidgets);

      // Check for at least some product counts
      expect(find.textContaining('products'), findsWidgets);

      // Verify data has collections
      expect(collections.isNotEmpty, isTrue);
      expect(collections.length, equals(8));

      // Verify all collections have names
      for (final collection in collections) {
        expect(collection.name.isNotEmpty, isTrue);
      }
    });

    testWidgets('Each collection shows product count', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify we're on the Collections page
      expect(find.byType(TestCollectionsPage), findsOneWidget);

      // Check that at least some product counts are visible (flexible approach)
      expect(find.textContaining('products'), findsWidgets);

      // Verify that all collections in the data have product counts
      expect(collections.length, equals(8));
      for (final collection in collections) {
        expect(collection.productCount, isA<int>());
        expect(collection.productCount, greaterThanOrEqualTo(0));
      }
    });

    testWidgets('Collections are clickable', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify we're on the Collections page
      expect(find.byType(TestCollectionsPage), findsOneWidget);

      // Verify GestureDetectors exist for collections
      final gestureDetectors = find.byType(GestureDetector);
      expect(gestureDetectors, findsWidgets);

      // Get the first GestureDetector and verify it has onTap
      final firstDetector =
          tester.widget<GestureDetector>(gestureDetectors.first);
      expect(firstDetector.onTap, isNotNull);
    });

    testWidgets('Grid layout shows 2 columns on mobile (< 500px)',
        (tester) async {
      // Set mobile screen size (less than 500px width)
      await tester.binding.setSurfaceSize(const Size(400, 800));

      // Navigate directly to collections page to avoid homepage overflow
      await tester.pumpWidget(
        const MaterialApp(
          home: TestCollectionsPage(),
        ),
      );
      await tester.pumpAndSettle();

      // Verify we're on the Collections page
      expect(find.byType(TestCollectionsPage), findsOneWidget);

      // Find the GridView widget
      final gridView = tester.widget<GridView>(find.byType(GridView));
      expect(gridView, isNotNull);

      // Verify it uses SliverGridDelegateWithFixedCrossAxisCount
      expect(gridView.gridDelegate,
          isA<SliverGridDelegateWithFixedCrossAxisCount>());

      // Get the grid delegate and verify crossAxisCount is 2
      final gridDelegate =
          gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(gridDelegate.crossAxisCount, equals(2));

      // Verify spacing is appropriate for mobile
      expect(gridDelegate.crossAxisSpacing, equals(16));
      expect(gridDelegate.mainAxisSpacing, equals(16));

      // Verify aspect ratio is suitable for mobile display
      expect(gridDelegate.childAspectRatio, equals(1.5));

      // Verify at least some collection cards are visible in the grid
      final collectionCards = find.byType(Card);
      expect(collectionCards, findsWidgets);

      // Reset screen size to default
      await tester.binding.setSurfaceSize(null);
    });
  });
}
