import 'package:flutter/material.dart';

// Add enum for difficulty
enum StudyMode {
  showAll, // Default where everything shows
  easy,
  medium,
  hard,
}
// ----- Belt model (this is the blueprint for the Belt Object-----
// Each belt has 5 pieces of information. They are stored together in this class so every belt follows the same structure.
class Belt {
  final String color;
  final String name;
  final String meaning;
  final String form;
  final String steps;

  const Belt({
    required this.color,
    required this.name,
    required this.meaning,
    required this.form,
    required this.steps,
  });
}

// ----- Belt Data (This list has the actual belt info for each of the belts (belt objects)) -----
const List<Belt> belts = [
  Belt(
    color: "1st Degree Black Belt",
    name: "KWANG-GAE",
    meaning:
    "19th King of the Koguryo Dynasty. he regained all the lost territories. The diagram --Scholar-- represents the expansion and recovery of the territory lost. The 39 movements refer to his reign for 39 years.",
    form: "10 AND a form of your own making",
    steps: "All 6-three steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Brown Belt with two black stripes",
    name: "CHOONG-MOO",
    meaning:
    "The name given to the great admiral Yi Sun-Sin of the Yi Dynasty. He was reported to have invented the precursor of the precursor of the present day submarine. The reason why this pattern ends up with a left hand attack is to symbolize his regrettable death, in battle, before he could show his full potential and loyalty to the king. 30 moves. --I-- pattern.",
    form: "9",
    steps: "All 6-three steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Brown Belt with one black stripe",
    name: "HWA-RANG",
    meaning:
    "The youth group which originated in the Silla Dynasty about 1350 years ago, became the actual driving force for the unification of the Kingdom of Korea. 29 moves. --I-- pattern.",
    form: "8",
    steps: "All 6-three steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Brown Belt",
    name: "TOI-GYE",
    meaning:
    "Pen-name of the noted scholar Yi-Hwang, 37 movements refer to his birthplace on 37th latitude. --Scholar-- pattern.",
    form: "7",
    steps: "All 6-three steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Blue Belt with two brown stripes",
    name: "CHOONG-GUN",
    meaning:
    "The patriot An Chung-Gun who assassinated the first Japanese Governor- General of Korea (known as the man who played the leading part of the Korea-Japan merger). 32 movements represent his age when he was executed. --I-- pattern.",
    form: "6",
    steps: "All 6-three steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Blue Belt with one brown stripe",
    name: "YUL-KOK",
    meaning:
    "A great philosopher and scholar Yi-I, 'Confucius of Korea', 38 movements of this pattern refer to his birthplace on 38th latitude and the diagram represents 'scholar', full pattern.",
    form: "5",
    steps: "All 6-three steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Blue Belt",
    name: "WON-HYO",
    meaning:
    "Monk who introduced Buddhism to the Silla Dynasty, 28 moves, --I-- pattern.",
    form: "4",
    steps: "All 6-one steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Green Belt",
    name: "TO-SAN",
    meaning:
    "The patriot Ahn Chang-Ho who devoted his entire life to furthering the education of Korea, 24 moves, --ZigZag-- pattern.",
    form: "3",
    steps: "All 6-one steps AND 6-one steps of your own making.",
  ),
  Belt(
    color: "Yellow Belt with one green stripe",
    name: "TAN-GUN",
    meaning: "the legendary founder of Korea, 21 moves, --I-- pattern.",
    form: "2",
    steps: "All 6-one steps.",
  ),
  Belt(
    color: "Yellow Belt",
    name: "CHON-JI",
    meaning: "Heaven and Earth, 19 moves --Cross-- pattern.",
    form: "1",
    steps: "The first 5-one steps.",
  ),
  Belt(
    color: "White Belt",
    name: "none - Beginner",
    meaning: "none - Beginner",
    form: "none - Beginner",
    steps: "none - Beginner",
  ),
];

// Detect number of stripes on belt from text
int getStripeCount(String colorText) {
  final lower =  colorText.toLowerCase();
  if (lower.contains("two")) return 2;
  if (lower.contains("one")) return 1;

  return 0;   // no stripes
}

// Pick main belt color based on base belt, not stripe text
Color getBeltBannerColor(String colorText) {
  final lower = colorText.toLowerCase();

  // Take everything before the word "belt" as the base description
  final parts = lower.split('belt');
  final basePart = parts.isNotEmpty ? parts[0] : lower;
  final base = basePart.trim();

  if (base.contains('black')) return Colors.black;
  if (base.contains('brown')) return Colors.brown;
  if (base.contains('blue')) return Colors.blue;
  if (base.contains('green')) return Colors.green;
  if (base.contains('yellow')) return Colors.yellow;
  if (base.contains('white')) return Colors.white;

  return Colors.grey.shade400;
}

// ----- App entry point (Flutter starts the app. -----
void main() {
  // Load the Root Widget TKDBeltStudyApp
  runApp(const TKDBeltStudyApp());
}

// ----- Root Widget of the app -----
// Global settings are set here (title, theme colors, screen order)
class TKDBeltStudyApp extends StatelessWidget {
  const TKDBeltStudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'TKD Belt Study',
    // App-wide colors
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      useMaterial3: true,
    ),
    // First screen the user sees
    home: const BeltListScreen(),
    );
  }
}

// ----- First Screen: Shows the list of belts -----
// Loop through the belts list and shows a card for each belt.
// Tapping a belt navigates to the belt detail screen.
class BeltListScreen extends StatelessWidget {
  const BeltListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TKD Belt Study'),
        centerTitle: true,
      ),
      // Creates a scrollable list one item at a time.
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: belts.length,
          itemBuilder: (context, index) {
            final belt = belts[index];

            // What shows on each card
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Main belt color bar
                  Container(
                    height: 14,
                    color: getBeltBannerColor(belt.color),
                  ),

                  // Stripe bars under the main bar
                  SizedBox(height: 4), // small gap below main color
                  ...List.generate(
                    getStripeCount(belt.color),
                    (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 3), // spacing between stripes
                      child: Container(
                      height: 6,
                      color: Colors.black,
                      ),
                    ),
                  ),

                  // Original title content
                  ListTile(
                    title: Text(
                      belt.color,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${belt.name}\nForm: ${belt.form}\nSteps: ${belt.steps}',
                    ),
                    isThreeLine: true,
                    trailing: const Icon(Icons.chevron_right),

                    // Go to another screen when tapped
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BeltDetailScreen(belt: belt),
                          ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
      ),
    );
  }
}

// ----- Second Screen: Shows details for a single belt -----
class BeltDetailScreen extends StatefulWidget {
  final Belt belt;

  const BeltDetailScreen({super.key, required this.belt});

  @override
  State<BeltDetailScreen> createState() => _BeltDetailScreenState();
}

class _BeltDetailScreenState extends State<BeltDetailScreen> {
  // Default mode--show everything
  StudyMode _mode = StudyMode.showAll;

  @override
  Widget build(BuildContext context) {
    // Name should be hidden on medium and hard, visible on easy
    final bool hideName =
        _mode == StudyMode.medium || _mode == StudyMode.hard;

    // Build display string for the name
    final String displayName = hideName
      ? _buildUnderscores(widget.belt.name.length)
        : widget.belt.name;

    // Meaning text with word-by-word masking based on mode
    final String meaningText =
        _buildMaskedMeaning(widget.belt.meaning, _mode);

    return Scaffold(
      appBar: AppBar(
        // Show the belt color in the top bar
        title: Text(widget.belt.color),
      ),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          // Allows scrolling if text is long
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Belt color bar & stripes on detail screen
                Container(
                  height: 20,
                  width: double.infinity,
                  color: getBeltBannerColor(widget.belt.color),
                ),
                const SizedBox(height: 4),
                ...List.generate(
                  getStripeCount(widget.belt.color),
                    (i) => Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        height: 6,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ----- Study Mode Selector -----
                  Text(
                    'Study Mode: ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),

                  Wrap(
                    spacing: 8,
                      children: [
                        ChoiceChip(
                          label: const Text('Show All'),
                          selected: _mode == StudyMode.showAll,
                          onSelected: (_) {
                            setState(() {
                              _mode = StudyMode.showAll;
                            });
                          },
                        ),
                        ChoiceChip(
                            label: const Text('Easy'),
                            selected: _mode == StudyMode.easy,
                          onSelected: (_) {
                              setState(() {
                                _mode = StudyMode.easy;
                              });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Medium'),
                          selected: _mode == StudyMode.medium,
                          onSelected: (_) {
                            setState(() {
                              _mode = StudyMode.medium;
                            });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Hard'),
                          selected: _mode == StudyMode.hard,
                          onSelected: (_) {
                            setState(() {
                              _mode = StudyMode.hard;
                            });
                          },
                        ),
                      ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),

                  // Form Info
                  _buildStudyRow(
                    label: 'Form',
                    value: widget.belt.form,
                    context: context,
                  ),
                  const SizedBox(height: 8),

                  // Pattern Name
                  _buildStudyRow(
                    label: 'Pattern Name',
                    value: displayName,
                    context: context,
                  ),
                  const SizedBox(height: 8),

                  // Steps Info
                  _buildStudyRow(
                    label: 'Steps',
                    value: widget.belt.steps,
                    context: context,
                  ),
                  const SizedBox(height: 16),

                  const Divider(),
                  const SizedBox(height: 16),

                  // Meaning Header
                  Text(
                    'Meaning:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),

                  // Full Meaning Paragraph (hidden on hard level)
                  Text(
                    meaningText,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
            ),

          ),
      ),
    );
  }

  // Helper to show label & value, with option to hide value
  Widget _buildStudyRow({
    required String label,
    required String value,
    required BuildContext context,
}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  // Build underscores matching roughly the length of the word missing
  String _buildUnderscores(int length) {
      if (length <= 0) return '';
      return '_' * length;
  }

  // Build the Meaning string with different masking behavior per mode
  String _buildMaskedMeaning(String text, StudyMode mode) {
    // Show original text in Show All mode
    if (mode == StudyMode.showAll) return text;

    // Split on spaces
    final words = text.split(' ');
    final int total = words.length;
    if (total == 0) return text;

    // Decide how many words to hide depending on mode
    int targetToHide;
    switch (mode) {
      case StudyMode.easy:
        // Want 3-5 words; use up to 5, but don't exceed total
        if (total >= 5) {
          targetToHide = 5;
        } else if (total >= 3) {
          targetToHide = 3;
        } else {
          targetToHide = total;
        }
        break;
      case StudyMode.medium:
        // Want 6-9 words
        if (total >= 9) {
          targetToHide = 9;
        } else if (total >= 6) {
          targetToHide = 6;
        } else {
          targetToHide = total;
        }
        break;
      case StudyMode.hard:
        // Hide everything
        targetToHide = total;
        break;
      case StudyMode.showAll:
        // Handled at top, but Dart wants this case
        return text;
    }

    // If targetToHide is 0, just return original text
    if (targetToHide <= 0) return text;

    // Decide which word indices to hide
    // Spread them roughly across teh sentence
    final Set<int> indicesToHide = {};

    if (mode == StudyMode.hard) {
      // Hide all word positions
      for (int i = 0; i < total; i++) {
        indicesToHide.add(i);
      }
    } else {
      // Easy and Medium: spread hidden words across text
      final double step = total / (targetToHide + 1);
      for (int i = 1; i <= targetToHide; i++) {
        int index = (step * i).round() - 1;
        if (index < 0) index = 0;
        if (index >= total) index = total - 1;
        indicesToHide.add(index);
      }
    }

    // Build the final list of tokens, replacing chosen ones with blanks
    final List<String> maskedWords = [];
    for (int i = 0; i < total; i++) {
      final original = words[i];
      if (indicesToHide.contains(i)) {
        // Replace this word with underscores about the same length
        maskedWords.add(_buildUnderscores(original.length));
      } else {
        maskedWords.add(original);
      }
    }
    return maskedWords.join(' ');
  }
}