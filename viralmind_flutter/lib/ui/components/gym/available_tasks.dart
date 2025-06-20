import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viralmind_flutter/application/apps.dart';
import 'package:viralmind_flutter/application/settings.dart';
import 'package:viralmind_flutter/assets.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_app.dart';
import 'package:viralmind_flutter/domain/models/forge_task/forge_task_item.dart';
import 'package:viralmind_flutter/domain/models/gym_settings.dart';
import 'package:viralmind_flutter/domain/models/ui/gym_filter.dart';
import 'package:viralmind_flutter/ui/components/gym/task_card.dart';

class AvailableTasks extends ConsumerStatefulWidget {
  const AvailableTasks({
    super.key,
    this.poolId,
  });
  final String? poolId;
  @override
  ConsumerState<AvailableTasks> createState() => _AvailableTasksState();
}

class _AvailableTasksState extends ConsumerState<AvailableTasks> {
  late GymFilter _filter;
  List<String> _allCategories = [];
  final Set<String> _selectedCategories = {};
  String _sort = 'htl';
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    _filter = const GymFilter();
    _fetchCategories();

    // Initialize controllers when settings are loaded
    ref.listenManual(gymSettingsNotifierProvider, (previous, next) {
      if (next.hasValue) {
        final settings = next.value!;
        _minPriceController.text = settings.minPrice.toString();
        _maxPriceController.text = settings.maxPrice.toString();
        _applyFilters();
      }
    });
  }

  Future<void> _fetchCategories() async {
    final categories = await ref.read(getGymCategoriesProvider.future);
    setState(() {
      _allCategories = categories;
    });
  }

  void _applyFilters() {
    final settings =
        ref.read(gymSettingsNotifierProvider).value ?? const GymSettings();
    final minPrice =
        int.tryParse(_minPriceController.text) ?? settings.minPrice;
    final maxPrice =
        int.tryParse(_maxPriceController.text) ?? settings.maxPrice;

    setState(() {
      _filter = GymFilter(
        poolId: widget.poolId,
        query:
            _searchController.text.isNotEmpty ? _searchController.text : null,
        categories: _selectedCategories.isNotEmpty
            ? _selectedCategories.toList()
            : null,
        minReward: minPrice,
        maxReward: maxPrice,
        hideAdult: settings.hideAdult,
      );
    });
  }

  int _getReward(ForgeApp app, ForgeTaskItem task) {
    return task.rewardLimit ?? app.poolId?.pricePerDemo.toInt() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final tasksProvider = getAppsForGymProvider(filter: _filter);
    final tasksAsync = ref.watch(tasksProvider);
    final settings = ref.watch(gymSettingsNotifierProvider);

    return settings.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          Center(child: Text('Error loading settings: $err')),
      data: (gymSettings) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          if (_showFilters) _buildFilterPanel(gymSettings),
          Expanded(
            child: tasksAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (apps) {
                if (apps.isEmpty) {
                  return const Center(child: Text('No tasks found.'));
                }
                final tasks = apps
                    .expand(
                      (app) =>
                          app.tasks.map((task) => {'app': app, 'task': task}),
                    )
                    .toList()
                  ..sort((a, b) {
                    final rewardA = _getReward(
                      a['app']! as ForgeApp,
                      a['task']! as ForgeTaskItem,
                    );
                    final rewardB = _getReward(
                      b['app']! as ForgeApp,
                      b['task']! as ForgeTaskItem,
                    );
                    return _sort == 'htl'
                        ? rewardB.compareTo(rewardA)
                        : rewardA.compareTo(rewardB);
                  });

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 2.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final app = tasks[index]['app']! as ForgeApp;
                    final task = tasks[index]['task']! as ForgeTaskItem;
                    return TaskCard(app: app, task: task);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Available Tasks',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                  color: VMColors.secondaryText,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${ref.watch(getAppsForGymProvider(filter: _filter)).asData?.value.map((e) => e.tasks.length).fold(0, (a, b) => a + b) ?? 0} Available',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
            icon: Icon(
              _showFilters ? Icons.keyboard_arrow_up : Icons.filter_list,
            ),
            label: const Text('Filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterPanel(GymSettings settings) {
    return Card(
      margin: const EdgeInsets.all(16).copyWith(top: 0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _searchController,
                    onSubmitted: (_) => _applyFilters(),
                    decoration: const InputDecoration(
                      labelText: 'Search tasks',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _minPriceController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Min',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text('to'),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _maxPriceController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Max',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Sort'),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _sort,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        items: const [
                          DropdownMenuItem(
                            value: 'htl',
                            child: Text('High to Low'),
                          ),
                          DropdownMenuItem(
                            value: 'lth',
                            child: Text('Low to High'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _sort = value;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Categories'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: _selectedCategories.isEmpty,
                  onSelected: (selected) {
                    if (selected) {
                      setState(_selectedCategories.clear);
                      _applyFilters();
                    }
                  },
                ),
                ..._allCategories.map(
                  (category) => FilterChip(
                    label: Text(category),
                    selected: _selectedCategories.contains(category),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedCategories.add(category);
                        } else {
                          _selectedCategories.remove(category);
                        }
                      });
                      _applyFilters();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: !settings.hideAdult,
                  onChanged: (value) {
                    ref
                        .read(gymSettingsNotifierProvider.notifier)
                        .saveGymSettings(
                          settings.copyWith(hideAdult: !(value ?? false)),
                        );
                  },
                ),
                const Text('Show adult content'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    _searchController.clear();
                    _selectedCategories.clear();
                    setState(() {
                      _sort = 'htl';
                    });
                    ref
                        .read(gymSettingsNotifierProvider.notifier)
                        .saveGymSettings(
                          const GymSettings(),
                        );
                    _applyFilters();
                  },
                  child: const Text('Reset Filters'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    final newSettings = settings.copyWith(
                      minPrice: int.tryParse(_minPriceController.text) ??
                          settings.minPrice,
                      maxPrice: int.tryParse(_maxPriceController.text) ??
                          settings.maxPrice,
                    );
                    ref
                        .read(gymSettingsNotifierProvider.notifier)
                        .saveGymSettings(newSettings);
                    _applyFilters();
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
