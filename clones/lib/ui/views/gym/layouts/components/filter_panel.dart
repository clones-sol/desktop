import 'package:clones/application/settings.dart';
import 'package:clones/assets.dart';
import 'package:clones/domain/models/gym_settings.dart';
import 'package:clones/ui/components/design_widget/buttons/btn_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterPanel extends ConsumerWidget {
  const FilterPanel({
    super.key,
    required this.settings,
    required this.searchController,
    required this.minPriceController,
    required this.maxPriceController,
    required this.sortValue,
    required this.onSortChanged,
    required this.allCategories,
    required this.selectedCategories,
    required this.onCategorySelected,
    required this.onSelectAllCategories,
    required this.onApplyFilters,
    required this.onResetFilters,
  });

  final GymSettings settings;
  final TextEditingController searchController;
  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;
  final String sortValue;
  final ValueChanged<String?> onSortChanged;
  final List<String> allCategories;
  final Set<String> selectedCategories;
  final Function(String, bool) onCategorySelected;
  final VoidCallback onSelectAllCategories;
  final VoidCallback onApplyFilters;
  final VoidCallback onResetFilters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search tasks',
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 6),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: theme.colorScheme.primaryContainer,
                          width: 0.5,
                        ),
                        gradient: VMColors.gradientInputFormBackground,
                      ),
                      child: TextField(
                        controller: searchController,
                        onSubmitted: (_) => onApplyFilters(),
                        style: theme.textTheme.bodyMedium,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color!
                                        .withValues(alpha: 0.2),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price (Min)',
                            style: theme.textTheme.titleSmall,
                          ),
                          const SizedBox(height: 6),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                width: 0.5,
                              ),
                              gradient: VMColors.gradientInputFormBackground,
                            ),
                            child: TextField(
                              controller: minPriceController,
                              onSubmitted: (_) => onApplyFilters(),
                              style: theme.textTheme.bodyMedium,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 12,
                                ),
                                hintText: 'Gym name',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color!
                                          .withValues(alpha: 0.2),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        'to',
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price (Max)',
                            style: theme.textTheme.titleSmall,
                          ),
                          const SizedBox(height: 6),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                width: 0.5,
                              ),
                              gradient: VMColors.gradientInputFormBackground,
                            ),
                            child: TextField(
                              controller: maxPriceController,
                              onSubmitted: (_) => onApplyFilters(),
                              style: theme.textTheme.bodyMedium,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 12,
                                ),
                                hintText: 'Gym name',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color!
                                          .withValues(alpha: 0.2),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sort by',
                      style: theme.textTheme.titleSmall,
                    ),
                    const SizedBox(height: 6),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          width: 0.5,
                        ),
                        gradient: VMColors.gradientInputFormBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          value: sortValue,
                          isExpanded: true,
                          underline: const SizedBox(),
                          dropdownColor: Colors.black.withValues(alpha: 0.9),
                          style: theme.textTheme.bodyMedium,
                          items: [
                            DropdownMenuItem(
                              value: 'htl',
                              child: Text(
                                'High to Low',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'lth',
                              child: Text(
                                'Low to High',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                          onChanged: onSortChanged,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Categories',
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: selectedCategories.isEmpty
                        ? VMColors.tertiary
                        : VMColors.tertiary,
                    width: 0.1,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  backgroundColor: selectedCategories.isEmpty
                      ? VMColors.tertiary
                      : Colors.transparent,
                ),
                onPressed: onSelectAllCategories,
                child: Text(
                  'All',
                  style: theme.textTheme.bodySmall,
                ),
              ),
              ...allCategories.map(
                (category) => OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: selectedCategories.contains(category)
                          ? VMColors.primary
                          : VMColors.tertiary,
                      width: 0.1,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    backgroundColor: selectedCategories.contains(category)
                        ? VMColors.tertiary
                        : Colors.transparent,
                  ),
                  onPressed: () => onCategorySelected(
                    category,
                    !selectedCategories.contains(category),
                  ),
                  child: Text(
                    category,
                    style: selectedCategories.contains(category)
                        ? Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: VMColors.primaryText,
                            )
                        : Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                checkColor: VMColors.primaryText,
                value: !settings.hideAdult,
                onChanged: (value) {
                  ref
                      .read(gymSettingsNotifierProvider.notifier)
                      .saveGymSettings(
                        settings.copyWith(hideAdult: !(value ?? false)),
                      );
                },
              ),
              Text(
                'Show adult content',
                style: theme.textTheme.titleSmall,
              ),
              const Spacer(),
              BtnPrimary(
                buttonText: 'Reset Filters',
                btnPrimaryType: BtnPrimaryType.outlinePrimary,
                onTap: onResetFilters,
              ),
              const SizedBox(width: 16),
              BtnPrimary(
                buttonText: 'Apply',
                onTap: onApplyFilters,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
